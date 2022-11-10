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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - ComputerGuessingViewInput

extension ComputerGuessingViewController: ComputerGuessingViewInput {
    
}
