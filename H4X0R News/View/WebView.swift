//
//  WebView.swift
//  H4X0R News
//
//  Created by Prathamesh Araikar on 07/01/22.
//

import Foundation
import WebKit
import SwiftUI

// UIViewRepresentable: To use this protocol we need to adopt two delegate methods which are makeUIView and updateUIView
// WKWebView: An object that displays interactive web content, such as for an in-app browser.

struct WebView: UIViewRepresentable {

    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
