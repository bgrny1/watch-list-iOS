//
//  Movie.swift
//  watchList
//
//  Created by Buket girenay on 25.11.2023.
//

import Foundation
import Alamofire


protocol Displayable {
    var titleLabelText: String { get }
    var posterLink: String { get }
    var idText: Int { get }
    var averagePoint: Double { get }
    var descriptionText: String { get }
}

struct WatchList: Decodable, Encodable {
    let title: String?
    let poster: String?
    let id : Int?
    let average: Double?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case poster = "poster_path"
        case id = "id"
        case average = "vote_average"
        case description = "overview"
    }
}

extension WatchList: Displayable {
    var descriptionText: String {
        description ?? ""
    }
    
    
    var averagePoint: Double {
        average ?? .zero
    }
    
    var idText: Int {
        id ?? .zero
    }
    
    var titleLabelText: String {
        title ?? ""
    }
    
    var posterLink: String {
        poster ?? ""
    }
    
}
