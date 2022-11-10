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
    
    private var number: Int?
    private var isInTheRange = Bool()
    
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
        if sender.alpha == 1 {
            
            if isInTheRange {
                let viewController = ComputerGuessingAssembly.assemblyModule()
                present(viewController, animated: true)
            } else {
                let message = "Введённое число должно находиться в диапазоне от 1 до 100 включительно."
                showAlert(message: message)
            }
            
        } else {
            let message = "Введите числовое значение."
            showAlert(message: message)
        }
    }
    
    @IBAction func checkEnteredText(_ sender: UITextField) {
        let text = sender.text ?? ""
        presenter?.checkEnteredText(text: text)
    }
}

// MARK: - GuessNumberViewInput

extension GuessNumberViewController: GuessNumberViewInput {
    
    func update(buttonState: Bool, number: Int?, isInTheRange: Bool) {
        if buttonState {
            enterNumberButton.alpha = 1
        } else {
            enterNumberButton.alpha = 0.5
        }
        
        self.number = number
        self.isInTheRange = isInTheRange
    }
}

// MARK: - Show alert

extension GuessNumberViewController {
    
    private func showAlert(message: String) {
        let alert = UIAlertController(
            title: "Ошибка ввода данных!",
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Закрыть", style: .cancel))
        present(alert, animated: true)
    }
}
