//
//  Example+Localizing.swift
//  Demo-SwiftUI-UIKit-Previews
//
//  Created by Quang Hà on 14/1/20.
//  Copyright © 2020 Quang Hà. All rights reserved.
//

import SwiftUI

struct Example_Localizing: View {
    var body: some View {
        HStack {
            Text("Hello")
            Text(verbatim: "Hello")
            Text(verbatim: NSLocalizedString("Hello", comment: ""))
        }
    }
}

struct Example_Localizing_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           Example_Localizing().environment(\.locale, Locale.init(identifier: "en-US"))
            Example_Localizing().environment(\.locale, Locale.init(identifier: "fr-FR"))
        }
    }
}
