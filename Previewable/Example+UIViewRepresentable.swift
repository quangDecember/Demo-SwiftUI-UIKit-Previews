//
//  Example+UIViewRepresentable.swift
//  Demo-SwiftUI-UIKit-Previews
//
//  Created by Quang Hà on 14/1/20.
//  Copyright © 2020 Quang Hà. All rights reserved.
//

import SwiftUI
import WebKit
struct NewWKWebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let w = WKWebView(frame: .zero)
        w.load(URLRequest(url: URL(string: "https://www.google.com")!))
        return w
    }
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<NewWKWebView>) {
        
    }
}

struct Example_UIViewRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        NewWKWebView()
    }
}
