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
    
    var url: URL
 
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
}
