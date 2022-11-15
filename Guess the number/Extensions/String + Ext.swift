//
//  String + Ext.swift
//  Guess the number
//
//  Created by Кирилл Раменский on 11.11.2022.
//

import Foundation

extension String {
    
    func isNumber() -> Bool {
        let numberCharacters = NSCharacterSet.decimalDigits.inverted
        return !self.isEmpty && self.rangeOfCharacter(from: numberCharacters) == nil
    }
}
