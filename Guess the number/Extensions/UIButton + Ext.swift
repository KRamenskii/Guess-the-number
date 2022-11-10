//
//  UIButton + Ext.swift
//  Guess the number
//
//  Created by Кирилл Раменский on 10.11.2022.
//

import UIKit

extension UIButton {
    
    func addCornerRadius() {
        layer.cornerRadius = bounds.height / 3
    }
    
    func addBorder() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = bounds.height / 4
    }
}
