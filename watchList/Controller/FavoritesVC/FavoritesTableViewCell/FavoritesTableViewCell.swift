//
//  FavoritesTableViewCell.swift
//  watchList
//
//  Created by Buket girenay on 26.11.2023.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var favoriteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func cellSetUp(watch: String){
        favoriteLabel.text = "\(watch)"
    }
}
