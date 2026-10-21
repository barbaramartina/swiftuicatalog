//
//  CodeSampleView.swift
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

import CoreTransferable
import SwiftUI
import UIKit

/// A piece of Swift code that can be read, copied to the pasteboard and shared
/// with other applications.
struct CodeSnippet: Transferable {

    /// Title of the snippet. It is used as the preview of the shared content.
    let title: String

    /// The Swift source code of the snippet.
    let code: String

    init(title: String, code: String) {
        self.title = title
        self.code = code
    }

    /// The snippet is shared as plain text, so that it can be pasted into any
    /// code editor.
    static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation(exporting: \.code)
    }
}

/// A collapsible block of code.
///
/// The block stays collapsed until the user expands it, so it never occupies
/// more space than a single line. Once expanded, the code can be selected,
/// copied to the pasteboard or shared through the system share sheet.
struct CodeSampleView: View {

    /// The snippet that is displayed.
    let snippet: CodeSnippet

    /// Indicates that the code was just copied to the pasteboard.
    @State private var showsCopiedFeedback = false

    var body: some View {
        DisclosureGroup {
            codeBlock
        } label: {
            Label {
                Text("Code")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            } icon: {
                Image(systemName: "curlybraces")
                    .foregroundStyle(.tint)
            }
        }
        .tint(.accentColor)
    }

    // MARK: - Code block

    private var codeBlock: some View {
        VStack(alignment: .leading, spacing: 12) {
            ScrollView(.horizontal, showsIndicators: true) {
                Text(SwiftSyntaxHighlighter.highlight(snippet.code))
                    .font(.system(.caption, design: .monospaced))
                    .textSelection(.enabled)
                    .padding(12)
            }
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(uiColor: .secondarySystemBackground))
            )

            HStack(spacing: 12) {
                copyButton
                shareButton
            }
        }
        .padding(.top, 8)
    }

    // MARK: - Buttons

    private var copyButton: some View {
        Button(action: copyToPasteboard) {
            Label {
                Text(copyButtonTitle)
            } icon: {
                Image(systemName: showsCopiedFeedback ? "checkmark" : "doc.on.doc")
            }
            .font(.footnote)
            .fontWeight(.semibold)
        }
        .buttonStyle(.bordered)
        .buttonBorderShape(.capsule)
        .accessibilityLabel(copyButtonAccessibilityLabel)
    }

    private var shareButton: some View {
        ShareLink(
            item: snippet,
            subject: Text("SwiftUI Code Sample"),
            message: Text(snippet.code),
            preview: SharePreview(snippet.title)
        ) {
            Label {
                Text("Share")
            } icon: {
                Image(systemName: "square.and.arrow.up")
            }
            .font(.footnote)
            .fontWeight(.semibold)
        }
        .buttonStyle(.bordered)
        .buttonBorderShape(.capsule)
        .accessibilityLabel(shareButtonAccessibilityLabel)
    }

    // MARK: - Texts

    private var copyButtonTitle: LocalizedStringResource {
        showsCopiedFeedback ? "Copied" : "Copy"
    }

    private var copyButtonAccessibilityLabel: LocalizedStringResource {
        showsCopiedFeedback ? "Code copied to the clipboard" : "Copy the code to the clipboard"
    }

    private var shareButtonAccessibilityLabel: LocalizedStringResource {
        "Share the code"
    }

    // MARK: - Actions

    /// Copies the code to the pasteboard and confirms it with a short feedback.
    private func copyToPasteboard() {
        UIPasteboard.general.string = snippet.code

        withAnimation {
            showsCopiedFeedback = true
        }

        Task { @MainActor in
            try? await Task.sleep(for: .seconds(2))
            withAnimation {
                showsCopiedFeedback = false
            }
        }
    }
}

#Preview {

    CodeSampleView(
        snippet: CodeSnippet(
            title: "Rounded Button",
            code: """
                Button("Click Me", action: {})
                    .modifier(ButtonFontModifier())
                    .modifier(
                        RoundedBordersModifier(
                            radius: 10,
                            lineWidth: 1,
                            color: .accentColor
                        )
                    )
                """
        )
    )
    .padding()

}
