//
//  API.swift
//  watchList
//
//  Created by Buket girenay on 25.11.2023.
//

import Foundation
import Alamofire

enum DataType: String {
    case popular
    case top_rated
}
enum FetchType: String {
    case movie = "movie"
    case id = "id"
}


class API {
    var apiKey = "090551690b6fde5dbd1e172ff2808408"
    func fetchMovies(page: Int, categorie: DataType, completion: (@escaping(WatchLists) -> Void)) {
        let request = AF.request("https://api.themoviedb.org/3/movie/\(categorie)?api_key=\(apiKey)&language=tr&page=\(page)")
            .validate()        
        request.responseDecodable(of: WatchLists.self) { (response) in
            completion(response.value ?? WatchLists(count: .zero, all: [], totalPages: .zero, page: .zero))
        }
    }
}
