//
//  CountryListModel.swift
//  Demo-SwiftUI-UIKit-Previews
//
//  Created by Quang Hà on 15/1/20.
//  Copyright © 2020 Quang Hà. All rights reserved.
//

import Foundation

func flag(country:String) -> String {
    let base : UInt32 = 127397
    var s = ""
    for v in country.unicodeScalars {
        s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
    }
    return String(s)
}

struct Country: Codable {
    let name: String
    let alpha2Code: String
    let altSpellings: [String]
    let nativeName: String
}

struct MockServerResponse {
    static let allCountries = """
[
    {
      "name": "Viet Nam",
      "topLevelDomain": [
        ".vn"
      ],
      "alpha2Code": "VN",
      "alpha3Code": "VNM",
      "callingCodes": [
        "84"
      ],
      "capital": "Hanoi",
      "altSpellings": [
        "VN",
        "Socialist Republic of Vietnam",
        "Cộng hòa Xã hội chủ nghĩa Việt Nam"
      ],
      "region": "Asia",
      "subregion": "South-Eastern Asia",
      "population": 92700000,
      "latlng": [
        16.16666666,
        107.83333333
      ],
      "demonym": "Vietnamese",
      "area": 331212,
      "gini": 35.6,
      "timezones": [
        "UTC+07:00"
      ],
      "borders": [
        "KHM",
        "CHN",
        "LAO"
      ],
      "nativeName": "Việt Nam",
      "numericCode": "704",
      "currencies": [
        {
          "code": "VND",
          "name": "Vietnamese đồng",
          "symbol": "₫"
        }
      ],
      "languages": [
        {
          "iso639_1": "vi",
          "iso639_2": "vie",
          "name": "Vietnamese",
          "nativeName": "Tiếng Việt"
        }
      ],
      "translations": {
        "de": "Vietnam",
        "es": "Vietnam",
        "fr": "Viêt Nam",
        "ja": "ベトナム",
        "it": "Vietnam",
        "br": "Vietnã",
        "pt": "Vietname",
        "nl": "Vietnam",
        "hr": "Vijetnam",
        "fa": "ویتنام"
      },
      "flag": "https://restcountries.eu/data/vnm.svg",
      "regionalBlocs": [
        {
          "acronym": "ASEAN",
          "name": "Association of Southeast Asian Nations",
          "otherAcronyms": [],
          "otherNames": []
        }
      ],
      "cioc": "VIE"
    },
{
  "name": "Japan",
  "topLevelDomain": [
    ".jp"
  ],
  "alpha2Code": "JP",
  "alpha3Code": "JPN",
  "callingCodes": [
    "81"
  ],
  "capital": "Tokyo",
  "altSpellings": [
    "JP",
    "Nippon",
    "Nihon"
  ],
  "region": "Asia",
  "subregion": "Eastern Asia",
  "population": 126960000,
  "latlng": [
    36,
    138
  ],
  "demonym": "Japanese",
  "area": 377930,
  "gini": 38.1,
  "timezones": [
    "UTC+09:00"
  ],
  "borders": [],
  "nativeName": "日本",
  "numericCode": "392",
  "currencies": [
    {
      "code": "JPY",
      "name": "Japanese yen",
      "symbol": "¥"
    }
  ],
  "languages": [
    {
      "iso639_1": "ja",
      "iso639_2": "jpn",
      "name": "Japanese",
      "nativeName": "日本語 (にほんご)"
    }
  ],
  "translations": {
    "de": "Japan",
    "es": "Japón",
    "fr": "Japon",
    "ja": "日本",
    "it": "Giappone",
    "br": "Japão",
    "pt": "Japão",
    "nl": "Japan",
    "hr": "Japan",
    "fa": "ژاپن"
  },
  "flag": "https://restcountries.eu/data/jpn.svg",
  "regionalBlocs": [],
  "cioc": "JPN"
}
]
"""
}
