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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Settings
    
    private func setupView() {
        
    }
    
    // MARK: - Actions
}

// MARK: - PlayerNumberGuessingViewInput

extension PlayerNumberGuessingViewController: PlayerNumberGuessingViewInput {
    
}
