//
//  HomeCell.swift
//  watchList
//
//  Created by Buket girenay on 24.11.2023.
//

import UIKit

public protocol collectionViewReload: AnyObject {
    func refreshList(isPopular: Bool)
}
 protocol watchDetail: AnyObject {
     func watchDetail(item: WatchList?)
}

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.register(UINib(nibName: "DetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DetailCollectionViewCell")
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.alwaysBounceVertical = true
        }
    }
    
    private var watchList: [WatchList] = []
    weak var delegate: collectionViewReload?
    weak var detailDelegate: watchDetail?
    var isPopularMovie: Bool = true
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCell(title: String?, data: [WatchList]?, isPopular: Bool) {
        watchList = data ?? []
        titleLabel.text = title
        collectionView.reloadData()
        isPopularMovie = isPopular
    }
}

extension HomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return watchList.count
        } else {
            return watchList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionViewCell", for: indexPath) as! DetailCollectionViewCell
        if indexPath.section == 0 {
            let item = watchList[indexPath.row]
            cell.setCell(watchList: item)
        } else if indexPath.section == 1 {
            let item = watchList[indexPath.row]
            cell.setCell(watchList: item)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (UIScreen.main.bounds.width / 2) - 24
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = watchList[indexPath.row]
        detailDelegate?.watchDetail(item: selectedItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == (watchList.count) - 2 {
            delegate?.refreshList(isPopular: isPopularMovie)
        }
    }
}
