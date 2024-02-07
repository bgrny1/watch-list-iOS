//
//  WatchDescriptionTableViewCellTableViewCell.swift
//  watchList
//
//  Created by Buket girenay on 26.11.2023.
//

import UIKit

class WatchDescriptionTableViewCellTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(text: String) {
        if text != "" {
            descriptionLabel.text = text
        } else {
         descriptionLabel.text   = Constant.DescriptionString.descriptionString
        }
    }
    
}
