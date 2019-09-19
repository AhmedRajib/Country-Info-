//
//  File.swift
//  jsonParse&Search
//
//  Created by Md Kamrul Hasan on 19/3/19.
//  Copyright © 2019 Md Kamrul Hasan. All rights reserved.
//

import Foundation

struct Info: Decodable {
    var name: String
    var capital: String
    var region: String
    var subregion: String
    var population: Int
    var flag: String
    
}
