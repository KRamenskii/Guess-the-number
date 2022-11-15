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
    
    @IBOutlet private weak var enterNumberButton: UIButton!
    @IBOutlet private weak var textField: UITextField!
    
    @IBOutlet weak var bottomAnchorEnterNumberButton: NSLayoutConstraint!
    
    
    @IBOutlet weak var topAnchorTextField: NSLayoutConstraint!
    
    
    private var number: Int?
    private var isInTheRange = Bool()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        registerKeyboardNotifications()
    }
    
    deinit {
        removeKeyboardNotifications()
    }
    
    func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo
        let keyboardFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        bottomAnchorEnterNumberButton.constant = 20 + keyboardFrameSize.height
        topAnchorTextField.constant = 20
    }
    
    @objc func keyboardWillHide() {
        bottomAnchorEnterNumberButton.constant = 70
        topAnchorTextField.constant = 70
    }
    
    // MARK: - Settings
    
    private func setupView() {
        enterNumberButton.addCornerRadius()
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(hideKeyboardOnSwipeDown))
        swipeDown.delegate = self
        swipeDown.direction =  UISwipeGestureRecognizer.Direction.down
        view.addGestureRecognizer(swipeDown)
        
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnSwipeDown))
        tapScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(tapScreen)
    }
    
    @objc func hideKeyboardOnSwipeDown() {
        view.endEditing(true)
    }
    
    // MARK: - Actions
    
    @IBAction func enterNumber(_ sender: UIButton) {
        if sender.alpha == 1 {
            
            if isInTheRange {
                if let hiddenNumber = number {
                    let viewController = ComputerGuessingAssembly.assemblyModule(hiddenNumber: hiddenNumber)
                    present(viewController, animated: true)
                }
            } else {
                let message = "The number entered must be between 1 and 100 inclusive."
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

// MARK: - UIGestureRecognizerDelegate

extension GuessNumberViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

// MARK: - UITextFieldDelegate

extension GuessNumberViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
