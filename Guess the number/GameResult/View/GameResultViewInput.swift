//
//  GameResultViewInput.swift
//  Guess the number
//
//  Created by Кирилл Раменский on 11.11.2022.
//

import Foundation

protocol GameResultViewInput: AnyObject {
    func update(numberOfComputerGuessing: Int, numberOfUserGuesses: Int, winner: Resources.Winners)
}
