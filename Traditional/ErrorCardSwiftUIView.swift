//
//  ErrorCardSwiftUIView.swift
//  Demo-SwiftUI-UIKit-Previews
//
//  Created by Quang Hà on 15/1/20.
//  Copyright © 2020 Quang Hà. All rights reserved.
//

import SwiftUI
struct ConnectionErrorFooterCard : View {
    var body : some View {
        HStack {
            Image(systemName: "exclamationmark.triangle").foregroundColor(
                Color.red)
                .font(Font.title.weight(.regular))
                .frame(minWidth: 48, minHeight: 48)
            Text(verbatim: "Connection Error: We are unable to connect to RestCountries, please try again later")
                .font(Font.system(size: 13))
                .foregroundColor(
                    Color.red)
        }
            
        .padding(5)
        .background(Color.yellow.clipShape(RoundedRectangle(cornerRadius: 7)))
            .overlay (
                RoundedRectangle(cornerRadius: 7, style: .continuous)
                    .stroke(Color.purple, lineWidth: 1)
            )
        .shadow(radius: 0.5)
        .padding(10)
        .background(Color.clear)
        .scaledToFit()
        
    }
}
struct PreviewsOfLittleView: PreviewProvider {
    static var previews: some View {
        Group {
            ConnectionErrorFooterCard()
        }
    }
}
