//
//  MapkitSwiftUIView.swift
//  Demo-SwiftUI-UIKit-Previews
//
//  Created by Quang Hà on 14/1/20.
//  Copyright © 2020 Quang Hà. All rights reserved.
//

import SwiftUI
import MapKit

struct MapkitSwiftUIView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<MapkitSwiftUIView>) -> MKMapView {
        return MKMapView(frame: .zero)
    }
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapkitSwiftUIView>) {
        
    }
}

struct MapkitSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MapkitSwiftUIView()
    }
}
