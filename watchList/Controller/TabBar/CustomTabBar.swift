//
//  CustomTabBar.swift
//  watchList
//
//  Created by Buket girenay on 25.11.2023.
//

import UIKit

class CustomTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.barTintColor = .black.withAlphaComponent(0.1)
        self.setUpTabs()
    }
    
    private func setUpTabs() {
        let home = createNavigationController(title: "Filmler", image: UIImage(systemName: "popcorn") ?? .actions, vc: HomeVC(nibName: "HomeVC", bundle: nil))
        let favorites = createNavigationController(title: "Favorilerim",image: UIImage(systemName: "heart") ?? .actions, vc: FavoritesVC(nibName: "FavoritesVC", bundle: nil))
        self.setViewControllers([home,favorites], animated: true)
    }
    
    private func createNavigationController(title: String, image: UIImage , vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.image = image
        nav.tabBarItem.title = title
        nav.navigationBar.isHidden = true
        return nav
    }
}



