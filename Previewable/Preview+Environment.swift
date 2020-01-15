//
//  Preview+Environment.swift
//  Demo-SwiftUI-UIKit-Previews
//
//  Created by Quang Hà on 15/1/20.
//  Copyright © 2020 Quang Hà. All rights reserved.
//

import SwiftUI

struct Preview_Environment: View {
    var body: some View {
        Text("Please")
            .padding()
            .foregroundColor(Color(.label))
            .background(Color(.systemBackground))
        
    }
}

struct Preview_Environment_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Preview_Environment()
            Preview_Environment().environment(\.colorScheme, ColorScheme.dark)
            Preview_Environment()
                .previewLayout(.sizeThatFits)
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
            Preview_Environment().previewLayout(.fixed(width: 200, height: 200))
        }
    }
}
