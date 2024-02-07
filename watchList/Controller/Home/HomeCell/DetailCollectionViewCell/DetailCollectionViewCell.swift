//
//  DetailCell.swift
//  watchList
//
//  Created by Buket girenay on 25.11.2023.
//

import UIKit
import Cosmos

class DetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var shadowView: UIView! {
        didSet {
            shadowView.layer.cornerRadius = 8
        }
    }
    @IBOutlet weak var movieImage: UIImageView! {
        didSet{
            movieImage.contentMode = .scaleToFill
            movieImage.layer.cornerRadius = 8
        }
    }
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var averageView: CosmosView! {
        didSet {
            averageView.setCosmos()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCell(watchList: WatchList) {
        movieImage.setImageWithUrl(urlString: Constant.UrlString.posterUrl + watchList.posterLink)
        if watchList.titleLabelText != "" {
            movieLabel.text = watchList.titleLabelText
        } else {
            movieLabel.text = Constant.TitleString.descriptionString
        }
        averageView.rating = watchList.averagePoint / 2
    }

}
