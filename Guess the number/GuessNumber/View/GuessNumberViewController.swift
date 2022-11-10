//
//  GuessNumberViewController.swift
//  Guess the number
//
//  Created by Кирилл Раменский on 10.11.2022.
//

import UIKit

final class GuessNumberViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: GuessNumberPresenter?
    
    @IBOutlet weak var enterNumberButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Settings
    
    private func setupView() {
        enterNumberButton.addCornerRadius()
    }
    
    // MARK: - Actions
    
    @IBAction func enterNumber(_ sender: UIButton) {
        
    }
    
    @IBAction func checkEnteredText(_ sender: UITextField) {
        let text = sender.text ?? ""
        presenter?.checkEnteredText(text: text)
    }
}

// MARK: - GuessNumberViewInput

extension GuessNumberViewController: GuessNumberViewInput {
    
    func update(buttonState: Bool) {
        if buttonState {
            enterNumberButton.alpha = 1
        } else {
            enterNumberButton.alpha = 0.5
        }
    }
}
