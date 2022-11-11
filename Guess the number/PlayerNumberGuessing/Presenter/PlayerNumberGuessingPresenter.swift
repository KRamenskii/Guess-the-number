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
    
    // MARK: - Init
    
    init(numberOfComputerGuessing: Int) {
        self.numberOfComputerGuessing = numberOfComputerGuessing
    }
}

// MARK: - PlayerNumberGuessingViewOutput

extension PlayerNumberGuessingPresenter: PlayerNumberGuessingViewOutput {
    
}
