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
    
    // MARK: - Init
    
    init(
        numberOfComputerGuessing: Int,
        hiddenNumber: Int
    ) {
        self.numberOfComputerGuessing = numberOfComputerGuessing
        self.hiddenNumber = hiddenNumber
    }
    
    // MARK: - Private functions
    
    
}

// MARK: - PlayerNumberGuessingViewOutput

extension PlayerNumberGuessingPresenter: PlayerNumberGuessingViewOutput {
    
    func viewWasAppear() {
        
    }
}
