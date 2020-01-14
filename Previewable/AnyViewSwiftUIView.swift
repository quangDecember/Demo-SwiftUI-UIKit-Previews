//
//  AnyViewSwiftUIView.swift
//  Demo-SwiftUI-UIKit-Previews
//
//  Created by Quang Hà on 14/1/20.
//  Copyright © 2020 Quang Hà. All rights reserved.
//

import SwiftUI

struct AnyViewSwiftUIView: View {
    var body: some View {
        let v = HStack {
            Image(systemName: "alarm")
            Spacer()
            Text(verbatim: "Please wake up").padding().background(Color.purple)
            Spacer()
            Image(systemName: "arrow.2.circlepath.circle.fill")
        }.background(Color.green)
        return self.containedView(v, o: UIDevice.current.orientation)
    }
    
    /// only called at init
    func containedView<T: View>(_ viewNeedScale: T, o: UIDeviceOrientation) -> AnyView {
        if o == .landscapeLeft || o == .landscapeRight {
            return AnyView(
                viewNeedScale
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
        }
        else {
            return AnyView(viewNeedScale.scaledToFit())
        }
    }
}

struct AnyViewSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AnyViewSwiftUIView()
    }
}
