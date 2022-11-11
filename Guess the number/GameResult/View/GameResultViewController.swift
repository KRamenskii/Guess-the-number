//
//  GameResultViewController.swift
//  Guess the number
//
//  Created by Кирилл Раменский on 11.11.2022.
//

import UIKit

final class GameResultViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: GameResultPresenter?
    
    @IBOutlet private weak var mainMenuButton: UIButton!
    @IBOutlet private weak var resultGameLabel: UILabel!
    @IBOutlet private weak var computerGameResultLabel: UILabel!
    @IBOutlet private weak var userGameResultLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.viewWasAppear()
    }
    
    // MARK: - Settings
    
    private func setupView() {
        mainMenuButton.addCornerRadius()
    }
    
    // MARK: - Actions
    
    @IBAction func exitToMainMenu(_ sender: UIButton) {
        let viewController = StartAssembly.assemblyModule()
        present(viewController, animated: true)
    }
}

// MARK: - GameResultViewInput

extension GameResultViewController: GameResultViewInput {
    
    func update(numberOfComputerGuessing: Int, numberOfUserGuesses: Int, winner: Resources.Winners) {
        computerGameResultLabel.text = "Computers's tries count: \(numberOfComputerGuessing)"
        userGameResultLabel.text = "Your's tries count: \(numberOfUserGuesses)"
        
        switch winner {
        case .computer:
            resultGameLabel.text = "You Lost"
        case .user:
            resultGameLabel.text = "You Win"
        }
    }
}
