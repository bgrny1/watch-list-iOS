//
//  HomeDS.swift
//  watchList
//
//  Created by Buket girenay on 25.11.2023.
//

import UIKit

enum HomeStateChange: StateChange {
    case refreshPopularMovies
    case refreshTopRatedMovies
    case nextPagePopularMovies
    case nextPageTopRatedMovies
    case navigateToDetail(item: WatchList?)
}

class HomeDS: StatefulDataSource<HomeStateChange> {
    let sectionList = HomeCellType.allCases
    var popularMovieList: [WatchList] = [] {
        didSet {
            self.emit(.refreshPopularMovies)
        }
    }
    var topRatedMovieList: [WatchList] = [] {
        didSet {
            self.emit(.refreshTopRatedMovies)
        }
    }
}

enum HomeCellType: Int, CaseIterable {
    case popular
    case topRated
}

extension HomeDS: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.sectionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        switch sectionList[indexPath.section] {
        case .popular:
            cell.setCell(title: "Popüler Fimler", data: popularMovieList, isPopular: true)
            cell.delegate = self
            cell.detailDelegate = self
        case .topRated:
            cell.setCell(title: "En Çok Oy Alan Filmler", data: topRatedMovieList, isPopular: false)
            cell.delegate = self
            cell.detailDelegate = self
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UIScreen.main.bounds.height / 2
    }
}

extension HomeDS: collectionViewReload {
    func refreshList(isPopular: Bool) {
        if isPopular{
            self.emit(.nextPagePopularMovies)
        } else{
            self.emit(.nextPageTopRatedMovies)
        }
    }
}
extension HomeDS: watchDetail {
    func watchDetail(item: WatchList?) {
        self.emit(.navigateToDetail(item: item))
    }
}

