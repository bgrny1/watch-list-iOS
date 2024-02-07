//
//  WatchDetailTableViewCell.swift
//  watchList
//
//  Created by Buket girenay on 26.11.2023.
//

import UIKit

import Cosmos

protocol favoritesButtonProtocol: AnyObject {
    func selectedCell()
}


class WatchDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBOutlet weak var shadowView: UIView! {
        didSet {
            shadowView.addShadow()
        }
    }
    
    @IBOutlet weak var movieImage: UIImageView! {
        didSet {
            movieImage.contentMode = .scaleToFill
            movieImage.layer.cornerRadius = 20
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    weak var delegate: favoritesButtonProtocol?
    var item: WatchList?
    var isClick: Bool = false
    var isFavorite: Bool = false
    var favoritesList: [String:Any] = [:]
    
    @IBAction func tapFavoriteButton(_ sender: Any) {
        delegate.self?.selectedCell()
    }
    
    func setCell(watch: WatchList?, isClick: Bool) {
        movieImage.setImageWithUrl(urlString: Constant.UrlString.posterUrl + (watch?.posterLink ?? ""))
        titleLabel.text = watch?.title
        item = watch
        if isClick {
            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
}
