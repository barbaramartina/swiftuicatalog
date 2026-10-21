//
//  SwiftSyntaxHighlighter.swift
//  SwiftUICatalog
//
//  MIT License
//
//  Copyright (c) 2024 Barbara M. Rodeker
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation
import SwiftUI

/// A small, self contained highlighter for Swift source code.
///
/// The catalog only needs a rough visual distinction between comments, string
/// literals and keywords, so the source is scanned once and split into coloured
/// segments. Any syntax the scanner does not recognise is simply kept as plain
/// text, which means a snippet can always be rendered.
enum SwiftSyntaxHighlighter {

    // MARK: - Types

    /// The kinds of tokens the highlighter is able to recognise.
    enum TokenKind {
        case comment
        case string
        case keyword
    }

    /// A continuous piece of source code sharing the same kind of token.
    private struct Segment {
        let text: String
        let kind: TokenKind?
    }

    // MARK: - Constants

    /// The Swift keywords that are highlighted in the rendered code.
    private static let keywords: Set<String> = [
        "actor", "any", "as", "associatedtype", "async", "await", "borrowing",
        "break", "case", "catch", "class", "consuming", "continue", "default",
        "defer", "deinit", "do", "else", "enum", "extension", "fallthrough",
        "false", "fileprivate", "final", "for", "func", "guard", "if", "import",
        "in", "init", "inout", "internal", "is", "lazy", "let", "macro",
        "mutating", "nil", "nonisolated", "open", "operator", "optional",
        "override", "package", "precedencegroup", "private", "protocol",
        "public", "repeat", "required", "rethrows", "return", "self",
        "sending", "some", "static", "struct", "subscript", "super", "switch",
        "throw", "throws", "true", "try", "typealias", "unowned", "var",
        "weak", "where", "while",
    ]

    private static let slash = ascii("/")
    private static let asterisk = ascii("*")
    private static let quote = ascii("\"")
    private static let newline = ascii("\n")
    private static let backslash = ascii("\\")

    /// Returns the UTF-16 value of the given ASCII character.
    private static func ascii(_ character: Character) -> UInt16 {
        character.unicodeScalars.first.map { UInt16($0.value) } ?? 0
    }

    // MARK: - Highlighting

    /// Returns the given source code with the recognised tokens coloured in.
    ///
    /// - Parameter code: The Swift source code to highlight.
    /// - Returns: An attributed version of the source code.
    static func highlight(_ code: String) -> AttributedString {
        var highlighted = AttributedString()

        for segment in segments(in: code) {
            var piece = AttributedString(segment.text)

            switch segment.kind {
            case .comment:
                piece.foregroundColor = .secondary
            case .string:
                piece.foregroundColor = Color(red: 0.84, green: 0.39, blue: 0.32)
            case .keyword:
                piece.foregroundColor = .accentColor
            case nil:
                break
            }

            highlighted += piece
        }

        return highlighted
    }

    // MARK: - Scanning

    /// Splits the given source code into segments of plain text, comments,
    /// string literals and keywords.
    ///
    /// - Parameter code: The Swift source code to scan.
    /// - Returns: The ordered list of segments covering the whole source code.
    private static func segments(in code: String) -> [Segment] {
        let units = Array(code.utf16)
        var segments: [Segment] = []
        var plainStart = 0
        var index = 0

        while index < units.count {
            let unit = units[index]

            // Line comment: //
            if unit == slash, index + 1 < units.count, units[index + 1] == slash {
                appendPlain(&segments, units, plainStart..<index)
                let start = index
                while index < units.count, units[index] != newline {
                    index += 1
                }
                segments.append(Segment(text: text(units, start..<index), kind: .comment))
                plainStart = index
                continue
            }

            // Block comment: /* */
            if unit == slash, index + 1 < units.count, units[index + 1] == asterisk {
                appendPlain(&segments, units, plainStart..<index)
                let start = index
                index += 2
                while index < units.count {
                    if units[index] == asterisk, index + 1 < units.count,
                       units[index + 1] == slash {
                        index += 2
                        break
                    }
                    index += 1
                }
                segments.append(
                    Segment(text: text(units, start..<min(index, units.count)), kind: .comment)
                )
                plainStart = index
                continue
            }

            // String literal: " or """
            if unit == quote {
                appendPlain(&segments, units, plainStart..<index)
                let start = index
                index = endOfStringLiteral(units, startingAt: index)
                segments.append(Segment(text: text(units, start..<index), kind: .string))
                plainStart = index
                continue
            }

            // Keyword
            if isIdentifierStart(unit) {
                var end = index
                while end < units.count, isIdentifierPart(units[end]) {
                    end += 1
                }
                let word = text(units, index..<end)
                if keywords.contains(word) {
                    appendPlain(&segments, units, plainStart..<index)
                    segments.append(Segment(text: word, kind: .keyword))
                    plainStart = end
                }
                index = end
                continue
            }

            index += 1
        }

        appendPlain(&segments, units, plainStart..<units.count)

        return segments
    }

    /// Returns the index right after the string literal that starts at the
    /// given index. Unterminated literals end at the end of the source code.
    private static func endOfStringLiteral(_ units: [UInt16], startingAt start: Int) -> Int {
        let count = units.count
        let isMultiline = start + 2 < count && units[start + 1] == quote
            && units[start + 2] == quote

        if isMultiline {
            var index = start + 3
            while index < count {
                if units[index] == backslash {
                    index += 2
                    continue
                }
                if index + 2 < count, units[index + 1] == quote, units[index + 2] == quote {
                    return min(index + 3, count)
                }
                index += 1
            }
            return count
        }

        var index = start + 1
        while index < count {
            if units[index] == backslash {
                index += 2
                continue
            }
            if units[index] == quote {
                return min(index + 1, count)
            }
            if units[index] == newline {
                return index
            }
            index += 1
        }
        return count
    }

    // MARK: - Helpers

    /// Appends the plain text found in the given range, if it is not empty.
    private static func appendPlain(
        _ segments: inout [Segment],
        _ units: [UInt16],
        _ range: Range<Int>
    ) {
        let plain = text(units, range)
        guard !plain.isEmpty else { return }
        segments.append(Segment(text: plain, kind: nil))
    }

    /// Converts the given range of UTF-16 code units into a string.
    private static func text(_ units: [UInt16], _ range: Range<Int>) -> String {
        let lowerBound = max(0, range.lowerBound)
        let upperBound = min(units.count, range.upperBound)
        guard lowerBound < upperBound else { return "" }
        return String(decoding: units[lowerBound..<upperBound], as: UTF16.self)
    }

    /// Indicates whether the given code unit can start a Swift identifier.
    private static func isIdentifierStart(_ unit: UInt16) -> Bool {
        switch unit {
        case 48...57:
            return false
        case 65...90, 97...122:
            return true
        case 95:
            return true
        default:
            return unit >= 128
        }
    }

    /// Indicates whether the given code unit can continue a Swift identifier.
    private static func isIdentifierPart(_ unit: UInt16) -> Bool {
        isIdentifierStart(unit) || (unit >= 48 && unit <= 57)
    }
}
