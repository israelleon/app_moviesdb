//
//  MoviePage.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 04/03/23.
//

import UIKit

class MoviePage: UIViewController {
    
    weak var delegate: MovieListDelegate? {
        didSet { uiView.delegate = delegate }
    }
    
    private var uiView: MovieListView = {
       let view = MovieListView()
        return view
    }()
    
    override func loadView() {
        view = uiView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func reload(by categoryData: MovieCategoryEntity) {
        uiView.dataSource = categoryData.tvShows.map{MovieTvShowItemDTO(movieItem: $0)}
    }
}
