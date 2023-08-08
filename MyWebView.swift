//
//  WebView.swift
//  swiftUI-weather
//
//  Created by Foysal on 8/8/23.
//

import SwiftUI
import WebKit

struct WebView: View {
    var body: some View {
        NavigationStack{
            myWebView(url: "http://google.com")
                .navigationTitle("WebView")
        }
        
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView()
    }
}

struct myWebView: UIViewRepresentable {
    let url: String
    func makeUIView(context: Context) -> WKWebView {
        
        return WKWebView()
        
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
       if let safeUrl = URL(string: url) {
            let request = URLRequest(url: safeUrl)
            uiView.load(request)
        }
        
    }
    
    
}
