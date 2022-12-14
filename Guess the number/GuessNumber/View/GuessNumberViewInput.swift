//
//  GuessNumberViewInput.swift
//  Guess the number
//
//  Created by Кирилл Раменский on 10.11.2022.
//

import Foundation

protocol GuessNumberViewInput: AnyObject {
    func update(buttonState: Bool, number: Int?, isInTheRange: Bool)
}
