//
//  PlayerNumberGuessingViewOutput.swift
//  Guess the number
//
//  Created by Кирилл Раменский on 11.11.2022.
//

import Foundation

protocol PlayerNumberGuessingViewOutput {
    func checkEnteredText(text: String)
    func guessButtonPressed(enteredNumber: Int)
    func checkEnteredNumber(enteredNumber: Int)
}
