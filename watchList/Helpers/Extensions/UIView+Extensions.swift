//
//  UIView+Extensions.swift
//  watchList
//
//  Created by Buket girenay on 25.11.2023.
//

import Foundation
import UIKit
import Cosmos

extension UIView {
    
    func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 4.0
    }
}

extension CosmosView {
    func setCosmos() {
        self.settings.updateOnTouch = false
        self.settings.totalStars = 5
        self.settings.starSize = 17
        self.settings.starMargin = 3.3
        self.settings.fillMode = .precise
    }
}
