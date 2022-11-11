//
//  GameResultAssembly.swift
//  Guess the number
//
//  Created by Кирилл Раменский on 11.11.2022.
//

import UIKit

final class GameResultAssembly {
    
    static func assemblyModule(numberOfComputerGuessing: Int, numberOfUserGuesses: Int) -> UIViewController {
        guard let view = UIStoryboard(name: "GameResult", bundle: nil).instantiateViewController(withIdentifier: "GameResultViewController") as? GameResultViewController else {
            return UIViewController()
        }
        
        let presenter = GameResultPresenter(
            numberOfComputerGuessing: numberOfComputerGuessing,
            numberOfUserGuesses: numberOfUserGuesses
        )
        
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
}
