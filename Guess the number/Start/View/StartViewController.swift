//
//  StartViewController.swift
//  Guess the number
//
//  Created by Кирилл Раменский on 10.11.2022.
//

import UIKit

final class StartViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: StartPresenter?
    
    @IBOutlet private weak var startButton: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Settings
    
    private func setupView() {
        startButton.addCornerRadius()
    }
    
    // MARK: - Actions
    
    @IBAction func startGame(_ sender: UIButton) {
        let viewController = GuessNumberAssembly.assemblyModule()
        present(viewController, animated: true)
    }
}

// MARK: - StartViewInput

extension StartViewController: StartViewInput {
    
}
