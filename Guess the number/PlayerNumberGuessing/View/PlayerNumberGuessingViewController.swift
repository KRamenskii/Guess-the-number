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
    
    @IBOutlet private weak var guessButton: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet weak var topAnchorTitle: NSLayoutConstraint!
    @IBOutlet weak var topAnchorSubtitle: NSLayoutConstraint!
    @IBOutlet weak var topAnchorTextField: NSLayoutConstraint!
    @IBOutlet weak var topAnchorGuessButton: NSLayoutConstraint!
    
    private var enteredNumber: Int?
    
    private var isInTheRange = true
    private var leftBorder = 1
    private var rightBorder = 100
    
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
    
    @objc func keyboardWillShow() {
        topAnchorTitle.constant = 10
        topAnchorSubtitle.constant = 10
        topAnchorTextField.constant = 10
        topAnchorGuessButton.constant = 10
    }
    
    @objc func keyboardWillHide() {
        topAnchorTitle.constant = 50
        topAnchorSubtitle.constant = 20
        topAnchorTextField.constant = 30
        topAnchorGuessButton.constant = 30
    }
    
    // MARK: - Settings
    
    private func setupView() {
        guessButton.addCornerRadius()
        
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
            
            if let enteredNumber {
                presenter?.guessButtonPressed(enteredNumber: enteredNumber)
            }
            
            if isInTheRange {
                if let enteredNumber {
                    presenter?.checkEnteredNumber(enteredNumber: enteredNumber)
                }
            } else {
                let message = "The number entered must be between \(leftBorder) and \(rightBorder) inclusive."
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

// MARK: - PlayerNumberGuessingViewInput

extension PlayerNumberGuessingViewController: PlayerNumberGuessingViewInput {
    
    func update(buttonState: Bool?, isInTheRange: Bool?, enteredNumber: Int?) {
        if let buttonState {
            if buttonState {
                guessButton.alpha = 1
            } else {
                guessButton.alpha = 0.5
            }
        }
        
        if let isInTheRange {
            self.isInTheRange = isInTheRange
        }
        
        if let enteredNumber {
            self.enteredNumber = enteredNumber
        }
    }
    
    func updateBorders(_ leftBorder: Int, _ rightBorder: Int) {
        self.leftBorder = leftBorder
        self.rightBorder = rightBorder
    }
    
    func openGameResultModule(numberOfComputerGuessing: Int, numberOfUserGuesses: Int) {
        let viewController = GameResultAssembly.assemblyModule(numberOfComputerGuessing: numberOfComputerGuessing, numberOfUserGuesses: numberOfUserGuesses)
        present(viewController, animated: true)
    }
    
    func updateResultGuessingNumber(condition: Resources.Conditions) {
        switch condition {
        case .more:
            titleLabel.text = "No, my number is more than yours"
        case .less:
            titleLabel.text = "No, my number is less than yours"
        default:
            break
        }
    }
}

// MARK: - UIGestureRecognizerDelegate

extension PlayerNumberGuessingViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

// MARK: - UITextFieldDelegate

extension PlayerNumberGuessingViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
