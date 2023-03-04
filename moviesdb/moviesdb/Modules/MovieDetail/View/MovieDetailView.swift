//
//  MovieDetailView.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 04/03/23.
//

import UIKit

class MovieDetailView: UIViewController, ViewProtocol {
    var presenter: MovieDetailPresenterViewProtocol!
    private var uiView = MovieDetailViewUI()
    
    override func loadView() {
       // TODO: complete here
        title = "Movies Details"
        view = uiView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.start()
    }
}

extension MovieDetailView: MovieDetailViewPresenterProtocol {
    // handle response of presenter.
}
