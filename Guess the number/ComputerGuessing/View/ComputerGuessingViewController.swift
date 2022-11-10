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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Settings
    
    private func setupView() {
        moreButton.addBorder()
        equalsButton.addBorder()
        lessButton.addBorder()
    }
}

// MARK: - ComputerGuessingViewInput

extension ComputerGuessingViewController: ComputerGuessingViewInput {
    
}
