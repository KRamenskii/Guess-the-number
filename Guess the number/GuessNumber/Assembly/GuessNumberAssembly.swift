//
//  GuessNumberAssembly.swift
//  Guess the number
//
//  Created by Кирилл Раменский on 10.11.2022.
//

import UIKit

final class GuessNumberAssembly {
    
    static func assemblyModule() -> UIViewController {
        guard let view = UIStoryboard(name: "GuessNumber", bundle: nil).instantiateViewController(withIdentifier: "GuessNumberViewController") as? GuessNumberViewController else {
            return UIViewController()
        }
        
        let presenter = GuessNumberPresenter()
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
}
