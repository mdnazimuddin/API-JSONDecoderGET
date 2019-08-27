//
//  JsonModel.swift
//  JSONDecoder
//
//  Created by Nazim Uddin on 27/8/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit
struct JsonModel:Decodable{
    let name:String
    let alpha3Code:String
    let capital:String
    let region:String
}
