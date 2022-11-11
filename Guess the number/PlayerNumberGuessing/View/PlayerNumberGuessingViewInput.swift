//
//  PlayerNumberGuessingViewInput.swift
//  Guess the number
//
//  Created by Кирилл Раменский on 11.11.2022.
//

import Foundation

protocol PlayerNumberGuessingViewInput: AnyObject {
    func update(buttonState: Bool?, isInTheRange: Bool?, enteredNumber: Int?)
    func updateBorders(_ leftBorder: Int, _ rightBorder: Int)
    func openGameResultModule(numberOfComputerGuessing: Int, numberOfUserGuesses: Int)
    func updateResultGuessingNumber(condition: Resources.Conditions)
}
