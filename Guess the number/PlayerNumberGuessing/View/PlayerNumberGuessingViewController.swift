//
//  PlayerNumberGuessingViewController.swift
//  Guess the number
//
//  Created by Кирилл Раменский on 11.11.2022.
//

import UIKit

final class PlayerNumberGuessingViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: PlayerNumberGuessingPresenter?
    
    @IBOutlet private weak var guessButton: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    
    private var enteredNumber: Int?
    
    private var isInTheRange = true
    private var leftBorder = 1
    private var rightBorder = 100
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Settings
    
    private func setupView() {
        guessButton.addCornerRadius()
    }
    
    // MARK: - Actions
    
    @IBAction func enterNumber(_ sender: UIButton) {
        if sender.alpha == 1 {
            
            if let enteredNumber {
                presenter?.guessButtonPressed(enteredNumber: enteredNumber)
            }
            
            if isInTheRange {
                if let enteredNumber {
                    presenter?.checkEnteredNumber(enteredNumber: enteredNumber)
                }
            } else {
                let message = "The number entered must be between \(leftBorder) and \(rightBorder) inclusive."
                showAlert(message: message)
            }
            
        } else {
            let message = "Enter a numeric value."
            showAlert(message: message)
        }
    }
    
    @IBAction func checkEnteredText(_ sender: UITextField) {
        let text = sender.text ?? String()
        presenter?.checkEnteredText(text: text)
    }
}

// MARK: - PlayerNumberGuessingViewInput

extension PlayerNumberGuessingViewController: PlayerNumberGuessingViewInput {
    
    func update(buttonState: Bool?, isInTheRange: Bool?, enteredNumber: Int?) {
        if let buttonState {
            if buttonState {
                guessButton.alpha = 1
            } else {
                guessButton.alpha = 0.5
            }
        }
        
        if let isInTheRange {
            self.isInTheRange = isInTheRange
        }
        
        if let enteredNumber {
            self.enteredNumber = enteredNumber
        }
    }
    
    func updateBorders(_ leftBorder: Int, _ rightBorder: Int) {
        self.leftBorder = leftBorder
        self.rightBorder = rightBorder
    }
    
    func openGameResultModule(numberOfComputerGuessing: Int, numberOfUserGuesses: Int) {
        let viewController = GameResultAssembly.assemblyModule(numberOfComputerGuessing: numberOfComputerGuessing, numberOfUserGuesses: numberOfUserGuesses)
        present(viewController, animated: true)
    }
    
    func updateResultGuessingNumber(condition: Resources.Conditions) {
        switch condition {
        case .more:
            titleLabel.text = "No, my number is more than yours"
        case .less:
            titleLabel.text = "No, my number is less than yours"
        default:
            break
        }
    }
}
