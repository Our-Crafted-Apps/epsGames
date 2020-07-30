//
//  StringExtensions.swift
//  ShareGames
//
//  Created by Кирилл Пучков on 30/03/2020.
//  Copyright © 2020 Кирилл Пучков. All rights reserved.
//

import UIKit

extension String {

    var localized: String {
        return NSLocalizedString(self, comment: self)
    }

    func capitalizingFirstLetter() -> String {
        let first = String(self.prefix(1)).capitalized
        let other = String(self.dropFirst())
        return first + other
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func lowercasingFirstLetter() -> String {
        let first = String(self.prefix(1)).lowercased()
        let other = String(self.dropFirst())
        return first + other
    }
    
    mutating func lowercaseFirstLetter() {
        self = self.lowercasingFirstLetter()
    }
    
    func trim() -> String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func count(of character: Character) -> Int {
        return self.filter { $0 == character }.count
    }

//    func convertHtmlSymbols() -> String {
//        guard let data = data(using: .utf8) else { return self }
//
//        let options: [String: Any] = [
//            NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
//            NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue
//        ]
//
//        let htmlDecodedAttributedString =  try? NSAttributedString(
//            data: data, options: options, documentAttributes: nil)
//
//        return htmlDecodedAttributedString?.string ?? ""
//    }

    func digitsOnly() -> String {
        let ucString = self.uppercased()
        let validCharacters = "0123456789"
        let characterSet: CharacterSet = CharacterSet(charactersIn: validCharacters)
        let stringArray = ucString.components(separatedBy: characterSet.inverted)
        return stringArray.joined(separator: "")
    }

    func removeFirstCharacter() -> String {
        if self.count < 2 { return "" }

        let originalString = self
        let resultString = originalString.index(originalString.startIndex, offsetBy: 1)
        //return originalString.substring(from: resultString)
        return String(originalString[resultString])
    }

    var isValidEmail: Bool {
        let emailFormat = "^([A-Za-z0-9_-]+\\.)*[A-Za-z0-9_-]+@[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*\\.[A-Za-z]{2,6}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
}


