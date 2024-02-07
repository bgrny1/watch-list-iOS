//
//  UIImage+Extensions.swift
//  watchList
//
//  Created by Buket girenay on 25.11.2023.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func setImageWithUrl(urlString: String) {
        
        if let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") {
            self.kf.indicatorType = .activity
            self.kf.setImage(
                with: url,
                placeholder: UIImage(named: "load-image"),
                options: [
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
        }
    }
}


