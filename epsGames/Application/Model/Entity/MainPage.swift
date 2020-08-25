//
//  Advert.swift
//  epsGames
//
//  Created by Кирилл Пучков on 05.08.2020.
//  Copyright © 2020 Sergey Mikhailov. All rights reserved.
//

import Foundation

struct MainPage: Decodable {
    
    //let namePatition: String
    let typePatition: String
    let list: [Advert]
}

struct Advert: Decodable {
    
    let idGame: Int
    let nameGame: String
    let urlImage: String
    let idObmen: Int?
    let namePlatform: String?
    let developer: String?
    let offerType: String? //тип объявления
    let nickname: String?
    let cost: String?
    let comment: String?
    let releaseDate: String?
    
}
