//
//  GameResultPresenter.swift
//  Guess the number
//
//  Created by Кирилл Раменский on 11.11.2022.
//

import Foundation

final class GameResultPresenter {
    
    // MARK: - Properties
    
    weak var view: GameResultViewInput?
    
    private let numberOfComputerGuessing: Int
    private var numberOfUserGuesses: Int
    
    // MARK: - Init
    
    init(
        numberOfComputerGuessing: Int,
        numberOfUserGuesses: Int
    ) {
        self.numberOfComputerGuessing = numberOfComputerGuessing
        self.numberOfUserGuesses = numberOfUserGuesses
    }
    
    // MARK: - Private methods
    
    private func winner() -> Resources.Winners {
        if numberOfComputerGuessing > numberOfUserGuesses {
            return .user
        } else {
            return .computer
        }
    }
}

// MARK: - GameResultViewOutput

extension GameResultPresenter: GameResultViewOutput {
    
    func viewWasAppear() {
        view?.update(numberOfComputerGuessing: numberOfComputerGuessing, numberOfUserGuesses: numberOfUserGuesses, winner: winner())
    }
}
