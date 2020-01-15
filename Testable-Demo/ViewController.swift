//
//  ViewController.swift
//  Testable-Demo
//
//  Created by Quang Hà on 15/1/20.
//  Copyright © 2020 Quang Hà. All rights reserved.
//

import UIKit
@testable import Demo_SwiftUI_UIKit_Previews

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let u = PreviewCollection.countryTableWithAlert()
        u.modalPresentationStyle = .fullScreen
        self.present(u, animated: true, completion: nil)
    }
}

