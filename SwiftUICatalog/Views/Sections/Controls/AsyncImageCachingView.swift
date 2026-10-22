// MARK: - MCP Metadata
// @symbol: AsyncImageCachingView
// @category: swiftui
// @tags: hierarchical, navigation
// ---

import SwiftUI

struct AsyncImageCachingView: View {
    let imageUrl = URL(string: "https://picsum.photos/400/600")!

    var body: some View {
        NavigationStack {
            List {
                Section("Default HTTP Caching") {
                    Text("Uses standard HTTP caching by default in iOS 27")
                    AsyncImage(url: imageUrl) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                }

                Section("Custom Cache Policy") {
                    Text("Using URLRequest for custom cache policy")
                    let request = URLRequest(url: imageUrl, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
                    AsyncImage(request: request) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                }

                Section("Custom URLSession") {
                    Text("Using a custom URLSession via modifier")
                    AsyncImage(url: imageUrl) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .asyncImageURLSession(.shared)
                }
            }
            .navigationTitle("AsyncImage Caching")
        }
    }
}

#Preview {
    AsyncImageCachingView()
}
