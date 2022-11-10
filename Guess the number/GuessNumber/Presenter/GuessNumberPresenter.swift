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
    
    private func buttonState(text: String) -> Bool {
        return text.isNumber()
    }
    
}

// MARK: - GuessNumberViewOutput

extension GuessNumberPresenter: GuessNumberViewOutput {
    
    func checkEnteredText(text: String) {
        view?.update(buttonState: buttonState(text: text))
    }
}

