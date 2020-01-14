//
//  DeviceOrientationSwiftUIView.swift
//  Demo-SwiftUI-UIKit-Previews
//
//  Created by Quang Hà on 14/1/20.
//  Copyright © 2020 Quang Hà. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
class DeviceOrientationObservable : ObservableObject {
    @Published var orientation = UIDevice.current.orientation
    
    init () {
        NotificationCenter.default.addObserver(self, selector: #selector(isRotated), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    @objc func isRotated() {
        self.orientation = UIDevice.current.orientation
    }
}

struct DeviceOrientationSwiftUIView: View {
    @ObservedObject var orientation = DeviceOrientationObservable()
    var body: some View {
        if orientation.orientation.isPortrait {
            return Text("Portrait")
        } else {
            return Text("Landscape")
        }
    }
}

struct DeviceOrientationSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceOrientationSwiftUIView()
    }
}
