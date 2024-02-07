//
//  BaseVC.swift
//  watchList
//
//  Created by Buket girenay on 25.11.2023.
//

import UIKit

class BaseVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        observeDataSource()
        observeViewModel()
    }
    
    func push(to: UIViewController, completionHandler: (() -> Void)? = nil, animated: Bool = true) {
        navigationController?.pushViewController(to, animated: animated)
        completionHandler?()
    }
}

extension BaseVC {
    
    @objc open func observeViewModel() {}
    
    @objc open func observeDataSource() {}
}
