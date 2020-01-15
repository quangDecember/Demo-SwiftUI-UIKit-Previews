//
//  Demo_SwiftUI_UIKit_PreviewsTests.swift
//  Demo-SwiftUI-UIKit-PreviewsTests
//
//  Created by Quang Hà on 15/1/20.
//  Copyright © 2020 Quang Hà. All rights reserved.
//

import XCTest
@testable import Demo_SwiftUI_UIKit_Previews

class Demo_SwiftUI_UIKit_PreviewsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFlagFinding() {
        print(flag(country: "AF"))
        print(flag(country: "VN"))
    }
    
    func testCountryModel() throws {
        let s = try JSONDecoder().decode([Country].self, from: MockServerResponse.allCountries.data(using: .utf8)!)
        print(s)
    }
    
    func testCallRestCountries() {
        let exp = XCTestExpectation(description: "complete network")
        Loader.init().loadCountries(completion: {result in
            switch result {
            case .success(let l):
                print(l)
                exp.fulfill()
            case .failure(let err):
                XCTFail("\(err)")
            }
        })
        wait(for: [exp], timeout: 5)
    }
}
