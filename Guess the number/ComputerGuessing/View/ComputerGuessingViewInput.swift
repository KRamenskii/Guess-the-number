//
//  ComputerGuessingViewInput.swift
//  Guess the number
//
//  Created by Кирилл Раменский on 10.11.2022.
//

import Foundation

protocol ComputerGuessingViewInput: AnyObject {
    func update(generatedNumber: Int?, numberOfComputerGuessing: Int?, isChosenCorrectly: Bool?, hiddenNumber: Int?)
}
