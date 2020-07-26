//
//  Filter.swift
//  ShareGames
//
//  Created by Кирилл Пучков on 11/06/2020.
//  Copyright © 2020 Кирилл Пучков. All rights reserved.
//

import Foundation

struct FilterSetting: Decodable {
    
    var type: String
    var title: String
    var data: [Parametr]
}

struct Parametr: Decodable {
    var id: Int
    var value: String
    var title: String
    var select = false
    
}


