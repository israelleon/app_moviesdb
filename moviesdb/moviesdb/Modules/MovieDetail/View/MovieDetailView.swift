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
    private var object: MovieDetailEntity?
    
    override func loadView() {
        uiView.datasource = self
        uiView.delegate = self
        view = uiView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.start()
    }
}

extension MovieDetailView: MovieDetailViewPresenterProtocol {
    func renderMovieDetail(entity: MovieDetailEntity) {
        object = entity
        DispatchQueue.main.async { [weak uiView] in
            uiView?.reload()
        }
    }
}

extension MovieDetailView: MovieDetailViewUIDatasource {
    func objectFor(view: MovieDetailViewUI) -> MovieDetailEntity? {
       return object
    }
}

extension MovieDetailView: MovieDetailViewUIDelegate {
    
}
