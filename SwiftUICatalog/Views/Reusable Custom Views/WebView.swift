//
//  WebView.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 2022-05-21.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable, Identifiable {
    
    var id: String {
        return url.absoluteString
    }
    /// url to load
    private let url: URL
    /// delegate to restrict the navigation to only the specified ulr
    private let delegate: WKWebViewDelegate
    
    init(url: URL) {
        self.url = url
        self.delegate = WKWebViewDelegate(url: url)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView()
        view.navigationDelegate = delegate
        return view
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.navigationDelegate = delegate
        webView.load(request)
    }
    
}

final class WKWebViewDelegate: NSObject, WKNavigationDelegate {
    private let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction) async -> WKNavigationActionPolicy {
        guard let urlToOpen = navigationAction.request.url,
              urlToOpen.absoluteString == url.absoluteString else {
            return .cancel
        }
        return .allow
    }
}
