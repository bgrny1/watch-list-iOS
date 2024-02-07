//
//  DetailVC.swift
//  watchList
//
//  Created by Buket girenay on 25.11.2023.
//

import UIKit
import Cosmos

class DetailVC: BaseVC {
    private var viewModel = DetailVM()
    
    @IBOutlet weak var watchTableView: UITableView!{
        didSet{
            watchTableView.register(UINib(nibName: "WatchDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "WatchDetailTableViewCell")
            watchTableView.register(UINib(nibName: "WatchDescriptionTableViewCellTableViewCell", bundle: nil), forCellReuseIdentifier: "WatchDescriptionTableViewCellTableViewCell")
            watchTableView.delegate = viewModel.dataSource
            watchTableView.dataSource = viewModel.dataSource
        }
    }
    
    var watchItem: WatchList? {
        didSet {
            viewModel.dataSource.watchList = watchItem
        }
    }
    var favoritesMovieList: [WatchList?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.dataSource.movieControl()
        self.navigationController?.navigationBar.isHidden = false
    }
}

extension DetailVC {
    
    override func observeDataSource() {
        super.observeDataSource()
        viewModel.dataSource.subscribe { [weak self] state in
            guard let self = self else { return }
            switch state {
            case .getDetail:
                watchTableView.reloadData()
            case .addFavorite(isClicked: let isClicked):
                if !isClicked {
                    var dict: [String:Any] = UserDefaults.standard.dictionary(forKey: "dictionary") ?? [:]
                    dict["\(String(describing: watchItem?.id))"] = watchItem?.titleLabelText
                    UserDefaults.standard.set(dict, forKey: "dictionary")
                    viewModel.dataSource.isFavorite?.toggle()
                    watchTableView.reloadData()
                } else {
                    var favoritesList = UserDefaults.standard.dictionary(forKey: "dictionary") ?? [:]
                    favoritesList.removeValue(forKey: "\(String(describing: viewModel.dataSource.watchList?.id))")
                    UserDefaults.standard.set(favoritesList, forKey: "dictionary")
                    UserDefaults.standard.synchronize()
                    viewModel.dataSource.isFavorite?.toggle()
                    watchTableView.reloadData()
                }
            }
        }
    }
}
