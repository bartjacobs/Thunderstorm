//
//  Configuration.swift
//  Thunderstorm
//
//  Created by Bart Jacobs on 28/08/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import Foundation

struct API {

    static let APIKey = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    static let BaseURL = URL(string: "https://api.forecast.io/forecast/")!

    static var AuthenticatedBaseURL: URL {
        return BaseURL.appendingPathComponent(APIKey)
    }

}
