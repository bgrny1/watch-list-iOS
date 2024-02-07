//
//  Movies.swift
//  watchList
//
//  Created by Buket girenay on 25.11.2023.
//

import Foundation

struct WatchLists: Decodable {
    let count: Int?
    let all: [WatchList]
    let totalPages: Int?
    let page: Int?
    
    enum CodingKeys: String, CodingKey {
        case count = "total_results"
        case all = "results"
        case totalPages = "total_pages"
        case page = "page"
    }
}
