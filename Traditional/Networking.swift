//
//  Networking.swift
//  Demo-SwiftUI-UIKit-Previews
//
//  Created by Quang Hà on 15/1/20.
//  Copyright © 2020 Quang Hà. All rights reserved.
//

import Foundation

class Loader {
    enum LoadError: Error {
        case unknown
    }
    func loadCountries(completion: @escaping (Result<[Country],Error>)->Void) {
        URLSession.shared.dataTask(with: URL(string: "https://restcountries.eu/rest/v2/all")!, completionHandler: { data, response, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            if let d = data {
                do {
                    let countryList = try JSONDecoder().decode([Country].self, from: d)
                    completion(.success(countryList))
                } catch (let parseError) {
                    completion(.failure(parseError))
                }
            }
            }).resume()
    }
}
