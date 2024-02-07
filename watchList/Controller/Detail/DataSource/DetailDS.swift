//
//  DetailDS.swift
//  watchList
//
//  Created by Buket girenay on 26.11.2023.
//

import Foundation
import UIKit

enum DetailVCSection: Int, CaseIterable {
    case detail
    case description
    
    var title: String {
        switch self {
        case .detail:
            return ""
        case .description:
            return "Film Hakkında"
        }
    }
}

enum DetailStateChange: StateChange {
    case getDetail
    case addFavorite(isClicked: Bool)
}

class DetailDS: StatefulDataSource<DetailStateChange> {
    var watchList: WatchList? {
        didSet {
            self.emit(.getDetail)
        }
    }
    let sectionList = DetailVCSection.allCases
    var isFavorite: Bool? = false
    
    func movieControl(){
        let favoritesList = UserDefaults.standard.dictionary(forKey: "dictionary") ?? [:]
        let IDList = favoritesList.map({$0.key })
        let result = IDList.contains("\(String(describing: watchList?.id))")
        if result {
            isFavorite = true
        } else {
            isFavorite = false
        }
    }
}

extension DetailDS: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch sectionList[indexPath.section] {
        case .detail:
            let cell = tableView.dequeueReusableCell(withIdentifier: "WatchDetailTableViewCell", for: indexPath) as! WatchDetailTableViewCell
            cell.setCell(watch: watchList, isClick: isFavorite ?? false)
            cell.delegate = self
            return cell
        case .description:
            let cell = tableView.dequeueReusableCell(withIdentifier: "WatchDescriptionTableViewCellTableViewCell", for: indexPath) as! WatchDescriptionTableViewCellTableViewCell
            cell.setCell(text: watchList?.descriptionText ?? "")
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionList[section].title
    }
}
extension DetailDS: favoritesButtonProtocol {
    func selectedCell() {
        self.emit(.addFavorite(isClicked: isFavorite ?? false))
    }
}

