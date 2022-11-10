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
        view?.update(generatedNumber: generatedNumber(leftBorder, rightBorder))
    }
    
    func changeRange(_ leftBorder: Int?, _ rightBorder: Int?) {
        if let leftBorder {
            self.leftBorder = leftBorder
        }
        
        if let rightBorder {
            self.rightBorder = rightBorder
        }
        
        view?.update(generatedNumber: generatedNumber(self.leftBorder, self.rightBorder))
    }
}
