//
//  NewsDetailView.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 02/02/24.
//

import SwiftUI
import WebKit
 
/// Provide Webview to open news url
struct NewsWebView: UIViewRepresentable {
 
    let newsURL: String
 
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: newsURL) {
            uiView.load(URLRequest(url: url))
        }
    }
}
