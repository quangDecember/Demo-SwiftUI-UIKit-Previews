//
//  WKWebCoordinatorSwiftUIView.swift
//  Demo-SwiftUI-UIKit-Previews
//
//  Created by Quang Hà on 14/1/20.
//  Copyright © 2020 Quang Hà. All rights reserved.
//

import SwiftUI
import WebKit

struct NavigatableWebView: View {
    @State var title = ""
    var body: some View {
        NavigationView{
            WKWebCoordinatorSwiftUIView(title: $title).navigationBarTitle(self.title)
        }
    }
}

struct WKWebCoordinatorSwiftUIView: UIViewRepresentable {
    class Navigator: NSObject{
        var webView: WKWebCoordinatorSwiftUIView
        init(_ webView: WKWebCoordinatorSwiftUIView ) {
            self.webView = webView
        }
        override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
            if keyPath == #keyPath(WKWebView.title) {
                if let o = object as? WKWebView {
                    self.webView.title = o.title ?? ""
                }
            }
        }
    }
    
    func makeCoordinator() -> Navigator {
        return Navigator(self)
    }
    
    @Binding var title: String
    
    func makeUIView(context: UIViewRepresentableContext<WKWebCoordinatorSwiftUIView>) -> WKWebView {
        let w = WKWebView.init(frame: .zero)
        w.load(URLRequest(url: URL(string: "https://news.ycombinator.com")!))
        w.addObserver(context.coordinator,
                      forKeyPath: #keyPath(WKWebView.title),
                      options: .new,
                      context: nil)
        return w
    }
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WKWebCoordinatorSwiftUIView>) {
        
    }
}

struct WKWebCoordinatorSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NavigatableWebView()
    }
}
