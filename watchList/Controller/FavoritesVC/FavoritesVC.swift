//
//  FavoritesVC.swift
//  watchList
//
//  Created by Buket girenay on 25.11.2023.
//

import UIKit

class FavoritesVC: UIViewController {
    
    @IBOutlet weak var favoritesTableView: UITableView!{
        didSet{
            favoritesTableView.register(UINib(nibName: "FavoritesTableViewCell", bundle: nil), forCellReuseIdentifier: "FavoritesTableViewCell")
            favoritesTableView.delegate = self
            favoritesTableView.dataSource = self
        }
    }
    var favoritesList: [String:Any] = [:]
    var favoritesTitles: [String] = []
    var watchListItem: WatchList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        favoritesTableView.reloadData()
        
    }
    override func viewWillAppear(_ animated: Bool) {
     setData()
    }
    
    func setData() {
        favoritesList = UserDefaults.standard.dictionary(forKey: "dictionary") ?? [:]
        favoritesTitles = favoritesList.map({$0.value as! String})
        favoritesTableView.reloadData()
    }
}
extension FavoritesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritesTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as! FavoritesTableViewCell
        cell.cellSetUp(watch: favoritesTitles[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            var newArray = UserDefaults.standard.dictionary(forKey: "dictionary") ?? [:]
            let arrayID = newArray.map({$0.key})
            newArray.removeValue(forKey: arrayID[indexPath.row])
            UserDefaults.standard.set(newArray, forKey: "dictionary")
            UserDefaults.standard.synchronize()
            setData()
        }
    }
}
