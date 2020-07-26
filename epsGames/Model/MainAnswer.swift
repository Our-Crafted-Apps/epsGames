//
//  Index.swift
//  ShareGames
//
//  Created by Кирилл Пучков on 01/04/2020.
//  Copyright © 2020 Кирилл Пучков. All rights reserved.
//

import Foundation

struct MainAnswer: Decodable {
    
    //let namePatition: String
    let typePatition: String
    let list: [List]
}

struct List: Decodable {
    
    let namePlatform: String
    let idGame: Int
    let nameGame: String
    let idObmen: Int?
    let developer: String?
    let offerType: String? //тип объявления
    let urlImage: String
    let nickname: String?
    let comment: String?
    let cost: String?
    let releaseDate: String?
    
}
