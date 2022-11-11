//
//  PlayerNumberGuessingPresenter.swift
//  Guess the number
//
//  Created by Кирилл Раменский on 11.11.2022.
//

import Foundation

final class PlayerNumberGuessingPresenter {
    
    // MARK: - Properties
    
    weak var view: PlayerNumberGuessingViewInput?
    
    private let numberOfComputerGuessing: Int
    private let hiddenNumber: Int
    
    private var enteredNumber: Int?
    
    private var leftBorder = 1
    private var rightBorder = 100
    private var numberOfUserGuesses = Int()
    
    // MARK: - Init
    
    init(
        numberOfComputerGuessing: Int,
        hiddenNumber: Int
    ) {
        self.numberOfComputerGuessing = numberOfComputerGuessing
        self.hiddenNumber = hiddenNumber
    }
    
    // MARK: - Private functions
    
    private func buttonState(_ text: String) -> Bool {
        return text.isNumber()
    }
    
    private func isInTheRange(_ text: String) -> Bool {
        guard text.isNumber() else { return false }
        var isInTheRange = Bool()
        if let number = Int(text) {
            switch number {
            case 1...100:
                isInTheRange = true
            default:
                isInTheRange = false
            }
        }
        return isInTheRange
    }
    
    private func changeRange(enteredNumber: Int) {
        if enteredNumber > hiddenNumber {
            rightBorder = enteredNumber - 1
        } else if enteredNumber < hiddenNumber {
            leftBorder = enteredNumber + 1
        }
    }
}

// MARK: - PlayerNumberGuessingViewOutput

extension PlayerNumberGuessingPresenter: PlayerNumberGuessingViewOutput {
    
    func checkEnteredText(text: String) {
        let number = text.isNumber() ? Int(text) : nil
        enteredNumber = number
        view?.update(buttonState: buttonState(text), isInTheRange: nil, enteredNumber: number)
    }
    
    func guessButtonPressed(enteredNumber: Int) {
        switch enteredNumber {
        case leftBorder...rightBorder:
            view?.update(buttonState: nil, isInTheRange: true, enteredNumber: nil)
            changeRange(enteredNumber: enteredNumber)
            view?.updateBorders(leftBorder, rightBorder)
        default:
            view?.update(buttonState: nil, isInTheRange: false, enteredNumber: nil)
        }
    }
    
    func checkEnteredNumber(enteredNumber: Int) {
        numberOfUserGuesses += 1
        if enteredNumber == hiddenNumber {
            view?.openGameResultModule(numberOfComputerGuessing: numberOfComputerGuessing, numberOfUserGuesses: numberOfUserGuesses)
        } else if enteredNumber > hiddenNumber {
            view?.updateResultGuessingNumber(condition: .less)
        } else if enteredNumber < hiddenNumber {
            view?.updateResultGuessingNumber(condition: .more)
        }
    }
}
