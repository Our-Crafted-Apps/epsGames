//
//  UserProfile.swift
//  ShareGames
//
//  Created by Кирилл Пучков on 27/03/2020.
//  Copyright © 2020 Кирилл Пучков. All rights reserved.
//

import Foundation

enum UserStatus: String {
    
    case register
    case notRegistered
    case setCountry
    case setCity
}

class UserProfile {
    
    var idUser: Int
    var userName: String
    var idCountry: Int
    var idCity: Int
    var status: UserStatus
    var language: String
    
    
    
    init(idUser: Int = 0, userName: String = "", idCountry: Int = 0, idCity: Int = 0, language: String = "en", status: UserStatus = .notRegistered) {
        self.idUser = idUser
        self.userName = userName
        self.idCountry = idCountry
        self.idCity = idCity
        self.language = language
        self.status = status
    }
    
}
