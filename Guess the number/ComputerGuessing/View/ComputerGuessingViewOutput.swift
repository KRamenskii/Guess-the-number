//
//  ComputerGuessingViewOutput.swift
//  Guess the number
//
//  Created by Кирилл Раменский on 10.11.2022.
//

import Foundation

protocol ComputerGuessingViewOutput {
    func viewWasAppear()
    func changeRange(_ leftBorder: Int?, _ rightBorder: Int?)
    func checkSelectedCondition(generatedNumber: Int, condition: Resources.Conditions)
}
