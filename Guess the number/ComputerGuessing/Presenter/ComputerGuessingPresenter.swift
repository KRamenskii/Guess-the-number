//
//  ComputerGuessingPresenter.swift
//  Guess the number
//
//  Created by Кирилл Раменский on 10.11.2022.
//

import Foundation

final class ComputerGuessingPresenter {
    
    // MARK: - Properties
    
    weak var view: ComputerGuessingViewInput?
    
    private let hiddenNumber: Int
    
    private var leftBorder = 1
    private var rightBorder = 100
    private var numberOfComputerGuessing = Int()
    
    // MARK: - Init
    
    init(hiddenNumber: Int) {
        self.hiddenNumber = hiddenNumber
    }
    
    // MARK: - Private methods
    
    private func generatedNumber(_ leftBorder: Int, _ rightBorder: Int) -> Int {
        return Int.random(in: leftBorder...rightBorder)
    }
}

// MARK: - ComputerGuessingViewOutput

extension ComputerGuessingPresenter: ComputerGuessingViewOutput {
    
    func viewWasAppear() {
        numberOfComputerGuessing += 1
        view?.update(generatedNumber: generatedNumber(leftBorder, rightBorder), numberOfComputerGuessing: numberOfComputerGuessing, isChosenCorrectly: nil, hiddenNumber: nil)
    }
    
    func changeRange(_ leftBorder: Int?, _ rightBorder: Int?) {
        if let leftBorder {
            self.leftBorder = leftBorder + 1
        }
        
        if let rightBorder {
            self.rightBorder = rightBorder - 1
        }
        
        numberOfComputerGuessing += 1
        view?.update(generatedNumber: generatedNumber(self.leftBorder, self.rightBorder), numberOfComputerGuessing: numberOfComputerGuessing, isChosenCorrectly: nil, hiddenNumber: nil)
    }
    
    func checkSelectedCondition(generatedNumber: Int, condition: Resources.Conditions) {
        var isChosenCorrectly = true
        
        switch condition {
        case .equals:
            isChosenCorrectly = generatedNumber == hiddenNumber ? true : false
        case .more:
            isChosenCorrectly = hiddenNumber > generatedNumber ? true : false
        case .less:
            isChosenCorrectly = hiddenNumber < generatedNumber ? true : false
        }
        
        view?.update(generatedNumber: nil, numberOfComputerGuessing: nil, isChosenCorrectly: isChosenCorrectly, hiddenNumber: nil)
    }
    
    func guessTheNumberByComputer() {
        let hiddenNumber = generatedNumber(1, 100)
        view?.update(generatedNumber: nil, numberOfComputerGuessing: nil, isChosenCorrectly: nil, hiddenNumber: hiddenNumber)
    }
}
