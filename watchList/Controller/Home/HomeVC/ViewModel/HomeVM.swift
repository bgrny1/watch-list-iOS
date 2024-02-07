//
//  HomeVM.swift
//  watchList
//
//  Created by Buket girenay on 25.11.2023.
//

import Foundation

enum HomeVMStateChange: StateChange {
    case getMovieFailure
}

class HomeVM:  StatefulVM<HomeVMStateChange> {
    let dataSource = HomeDS()
    
    func getPopularMovies(page: Int?) {
        API().fetchMovies(page: page ?? 1, categorie: .popular) { [weak self] movies in
            guard let self = self else { return }
            if movies.count != .zero {
                self.dataSource.popularMovieList.append(contentsOf: movies.all)
            } else {
                self.emit(.getMovieFailure)
            }
        }
    }
    
    func getTopRatedMovies(page: Int?) {
        API().fetchMovies(page: page ?? 1, categorie: .top_rated) { [weak self] movies in
            guard let self = self else { return }
            if movies.count != .zero {
                self.dataSource.topRatedMovieList.append(contentsOf: movies.all)
            } else {
                self.emit(.getMovieFailure)
            }
        }
    }
}

