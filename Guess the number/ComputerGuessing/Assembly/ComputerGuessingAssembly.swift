//
//  ComputerGuessingAssembly.swift
//  Guess the number
//
//  Created by Кирилл Раменский on 10.11.2022.
//

import UIKit

final class ComputerGuessingAssembly {
    
    static func assemblyModule(hiddenNumber: Int) -> UIViewController {
        guard let view = UIStoryboard(name: "ComputerGuessing", bundle: nil).instantiateViewController(withIdentifier: "ComputerGuessingViewController") as? ComputerGuessingViewController else {
            return UIViewController()
        }
        
        let presenter = ComputerGuessingPresenter(hiddenNumber: hiddenNumber)
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
}
