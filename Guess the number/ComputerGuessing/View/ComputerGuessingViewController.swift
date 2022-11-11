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
        let viewController = PlayerNumberGuessingAssembly.assemblyModule(numberOfComputerGuessing: numberOfComputerGuessing)
        present(viewController, animated: true)
    }
    
    @IBAction func tappedMoreButton(_ sender: UIButton) {
        presenter?.changeRange(generatedNumber, nil)
    }
    
    @IBAction func tappedLessButton(_ sender: UIButton) {
        presenter?.changeRange(nil, generatedNumber)
    }
}

// MARK: - ComputerGuessingViewInput

extension ComputerGuessingViewController: ComputerGuessingViewInput {
    
    func update(generatedNumber: Int, numberOfComputerGuessing: Int) {
        self.generatedNumber = generatedNumber
        self.numberOfComputerGuessing = numberOfComputerGuessing
    }
}
