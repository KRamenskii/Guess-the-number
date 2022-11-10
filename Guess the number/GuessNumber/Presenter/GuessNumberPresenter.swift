//
//  GuessNumberPresenter.swift
//  Guess the number
//
//  Created by Кирилл Раменский on 10.11.2022.
//

import Foundation

final class GuessNumberPresenter {
    
    // MARK: - Properties
    
    weak var view: GuessNumberViewInput?
    
    // MARK: - Private methods
    
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
}

// MARK: - GuessNumberViewOutput

extension GuessNumberPresenter: GuessNumberViewOutput {
    
    func checkEnteredText(text: String) {
        let number = text.isNumber() ? Int(text) : nil
        view?.update(buttonState: buttonState(text), number: number, isInTheRange: isInTheRange(text))
    }
}
