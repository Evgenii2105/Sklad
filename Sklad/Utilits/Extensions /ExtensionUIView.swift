//
//  Extensions.swift
//  Sklad
//
//  Created by Евгений Фомичев on 09.01.2026.
//

import UIKit

// MARK: - Extension UIView

extension UIView {
    
    func addConstraints(constraints: [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
}


