//
//  ComputerGuessingViewController.swift
//  Guess the number
//
//  Created by Кирилл Раменский on 10.11.2022.
//

import UIKit

final class ComputerGuessingViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: ComputerGuessingPresenter?
    
    @IBOutlet private weak var moreButton: UIButton!
    @IBOutlet private weak var equalsButton: UIButton!
    @IBOutlet private weak var lessButton: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    
    private var generatedNumber = Int() { didSet { setTitle() }}
    private var numberOfComputerGuessing = Int()
    private var isChosenCorrectly = true
    private var hiddenNumber: Int?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.viewWasAppear()
    }
    
    // MARK: - Settings
    
    private func setupView() {
        moreButton.addBorder()
        equalsButton.addBorder()
        lessButton.addBorder()
    }
    
    private func setTitle() {
        titleLabel.text = "Your number is - \(generatedNumber) ?"
    }
    
    // MARK: - Actions
    
    @IBAction func tappedEqualsButton(_ sender: UIButton) {
        presenter?.checkSelectedCondition(generatedNumber: generatedNumber, condition: .equals)
        
        if isChosenCorrectly {
            presenter?.guessTheNumberByComputer()
            if let hiddenNumber {
                let viewController = PlayerNumberGuessingAssembly.assemblyModule(numberOfComputerGuessing: numberOfComputerGuessing, hiddenNumber: hiddenNumber)
                present(viewController, animated: true)
            }
        } else {
            showAlert(message: "Choose a condition that satisfies the given number.")
        }
    }
    
    @IBAction func tappedMoreButton(_ sender: UIButton) {
        presenter?.checkSelectedCondition(generatedNumber: generatedNumber, condition: .more)
        
        if isChosenCorrectly {
            presenter?.changeRange(generatedNumber, nil)
        } else {
            showAlert(message: "Choose a condition that satisfies the given number.")
        }
    }
    
    @IBAction func tappedLessButton(_ sender: UIButton) {
        presenter?.checkSelectedCondition(generatedNumber: generatedNumber, condition: .less)
        
        if isChosenCorrectly {
            presenter?.changeRange(nil, generatedNumber)
        } else {
            showAlert(message: "Choose a condition that satisfies the given number.")
        }
    }
}

// MARK: - ComputerGuessingViewInput

extension ComputerGuessingViewController: ComputerGuessingViewInput {
    
    func update(generatedNumber: Int?, numberOfComputerGuessing: Int?, isChosenCorrectly: Bool?, hiddenNumber: Int?) {
        if let generatedNumber {
            self.generatedNumber = generatedNumber
        }
        
        if let numberOfComputerGuessing {
            self.numberOfComputerGuessing = numberOfComputerGuessing
        }
        
        if let isChosenCorrectly {
            self.isChosenCorrectly = isChosenCorrectly
        }
        
        if let hiddenNumber {
            self.hiddenNumber = hiddenNumber
        }
    }
}
