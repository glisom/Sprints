//
//  LinkPlayer.swift
//  Sprints
//
//  Created by Grant Isom on 11/27/23.
//

import SwiftUI
import UIKit
import WebKit

struct LinkPlayer: View {
    var embedId: String?
    var body: some View {
        if let embedId = embedId, embedId != "", let url = URL(string: "https://www.youtube.com/embed/\(embedId)") {
            WebView(url: url)
                .frame(maxHeight: 200)
        }
    }
}

struct WebView: UIViewRepresentable {
    var url: URL
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
