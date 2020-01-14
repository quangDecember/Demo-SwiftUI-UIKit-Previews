//
//  BindingSwiftUIView.swift
//  Demo-SwiftUI-UIKit-Previews
//
//  Created by Quang Hà on 14/1/20.
//  Copyright © 2020 Quang Hà. All rights reserved.
//

import SwiftUI

struct BindingSwiftUIView: View {
    @State private var isPresented = false
    var body: some View {
        NavigationView {
            HStack {
                Button(action: {
                    self.isPresented.toggle()
                }, label: {
                    Text("show Sheet")
                })
            }.sheet(isPresented: self.$isPresented, content: {
                Image(systemName: "plus.circle")
                .resizable()
            })
        }
        
    }
}

struct BindingSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        BindingSwiftUIView().previewDevice(PreviewDevice.init(rawValue: "iPhone SE"))
    }
}
