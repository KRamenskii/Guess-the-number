//
//  StartAssembly.swift
//  Guess the number
//
//  Created by Кирилл Раменский on 10.11.2022.
//

import UIKit

final class StartAssembly {
    
    static func assemblyModule() -> UIViewController {
        guard let view = UIStoryboard(name: "Start", bundle: nil).instantiateViewController(withIdentifier: "StartViewController") as? StartViewController else {
            return UIViewController()
        }
        
        let presenter = StartPresenter()
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
}
