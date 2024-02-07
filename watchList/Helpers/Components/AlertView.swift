//
//  AlertView.swift
//  watchList
//
//  Created by Buket girenay on 25.11.2023.
//

import Foundation
import UIKit

class AlertView {

static func showError(in viewController: UIViewController, message: String?) {
    let alert = UIAlertController(title: "Hata", message: message ?? "errorHappenedTryAgain", preferredStyle: .alert);
    alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
    viewController.present(alert, animated: true, completion: nil)
    }
}
