//
//  HomeVC.swift
//  watchList
//
//  Created by Buket girenay on 24.11.2023.
//

import UIKit


class HomeVC: BaseVC {
    
    private var viewModel = HomeVM()
    private var currentPage = 1
    private var currentPageTopRated = 1
    
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
            tableView.dataSource = self.viewModel.dataSource
            tableView.delegate = self.viewModel.dataSource
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getPopularMovies(page: currentPage)
        viewModel.getTopRatedMovies(page: currentPageTopRated)
    }
}

extension HomeVC {
    override func observeDataSource() {
        super.observeDataSource()
        viewModel.dataSource.subscribe { [weak self] state in
            guard let self = self else { return }
            switch state {
            case .refreshPopularMovies:
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .refreshTopRatedMovies:
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .nextPagePopularMovies:
                self.fetchNextPageFilm()
            case .nextPageTopRatedMovies:
                self.fetchTopRatedFilm()
            case .navigateToDetail(item: let item):
                let vc = DetailVC(nibName: "DetailVC", bundle: nil)
                vc.watchItem = item
                self.push(to: vc)
            }
        }
    }
    
    override func observeViewModel() {
        super.observeViewModel()
        viewModel.subscribe { [weak self] state in
            guard let self = self else { return }
            switch state {
            case .getMovieFailure:
                AlertView.showError(in: self, message: Constant.AlertMessage.alertErrorMessage)
            }
        }
    }
    
    private func fetchNextPageFilm() {
        self.currentPage += 1
        self.viewModel.getPopularMovies(page: currentPage)
    }
    
    private func fetchTopRatedFilm(){
        self.currentPageTopRated += 1
        self.viewModel.getTopRatedMovies(page: currentPageTopRated)
    }
}
