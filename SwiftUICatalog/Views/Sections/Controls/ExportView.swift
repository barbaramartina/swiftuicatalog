//
//  ImagesComponentView.swift
//  SwiftUICatalog
//
// MIT License
//
// Copyright (c) 2021 Barbara M. Rodeker
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
//
import SwiftUI
import Foundation
import UniformTypeIdentifiers

@MainActor
final class TextDocument: @preconcurrency WritableDocument {
    static let writableContentTypes: [UTType] = [.utf8PlainText]

    var text: String = "This is an example doc"

    nonisolated func writer(
        configuration: sending WriteConfiguration
    ) -> sending FileWrapperDocumentWriter<String> {
        FileWrapperDocumentWriter(configuration) { snapshot, _ in
            FileWrapper(regularFileWithContents: Data(snapshot.utf8))
        }
    }

    func snapshot(contentType: UTType) async throws -> String {
        text
    }
}

struct ExportView: View {
    @State private var document = TextDocument()
    @State private var isExporting = false

    var body: some View {
        VStack(spacing: 16) {
            Text("Document content:")
                .font(.largeTitle)
            Text(document.text)
                .font(.body)
            Divider()
            Button("Export") { isExporting = true }
                .fileExporter(
                    isPresented: $isExporting,
                    document: document,
                    defaultFilename: "Untitled"
                ) { _ in }
                .frame(maxWidth: .infinity)
                .buttonStyle(.glassProminent)
        }
        .padding(.horizontal, 16)
    }
}
