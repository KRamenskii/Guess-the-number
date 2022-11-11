//
//  PlayerNumberGuessingAssembly.swift
//  Guess the number
//
//  Created by Кирилл Раменский on 11.11.2022.
//

import UIKit

final class PlayerNumberGuessingAssembly {
    
    static func assemblyModule(numberOfComputerGuessing: Int, hiddenNumber: Int) -> UIViewController {
        guard let view = UIStoryboard(name: "PlayerNumberGuessing", bundle: nil).instantiateViewController(withIdentifier: "PlayerNumberGuessingViewController") as? PlayerNumberGuessingViewController else {
            return UIViewController()
        }
        
        let presenter = PlayerNumberGuessingPresenter(
            numberOfComputerGuessing: numberOfComputerGuessing,
            hiddenNumber: hiddenNumber
        )
        
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
}
