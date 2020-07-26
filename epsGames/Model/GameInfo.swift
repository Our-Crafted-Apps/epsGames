//
//  gameInfo.swift
//  ShareGames
//
//  Created by Кирилл Пучков on 02/04/2020.
//  Copyright © 2020 Кирилл Пучков. All rights reserved.
//

import Foundation

struct CellAds: Decodable {
    
    var type: String
    var data: [String: String]
    var data2: [[String: String]]?

}

//struct Game: Decodable {
//
//    let idGame: Int
//    let nameGame: String
//    let namePlatform: String
//    let urlImage: String
//    let releaseDate: String?
//    let developer: String?
//}


protocol Loopable {
    //func allProperties() throws -> [String: Any]
    func countProperties() -> Int
}

extension Loopable {
    //func allProperties() throws -> [String: Any] {
    func countProperties() -> Int {

        //var result: [String: Any] = [:]

        let mirror = Mirror(reflecting: self)

        // Optional check to make sure we're iterating over a struct or class
        guard let style = mirror.displayStyle, style == .struct || style == .class else {
            //throw NSError()
            return 0
        }

//        for (property, value) in mirror.children {
//            guard let property = property else {
//                continue
//            }
//
//            result[property] = value
//        }
        //print("mirror.children.count: \(mirror.children.count)")

        //return result
        return mirror.children.count
    }
}

