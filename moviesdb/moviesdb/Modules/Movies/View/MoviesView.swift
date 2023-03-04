//
//  MovieView.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import UIKit

class MoviesView: UIViewController, ViewProtocol {
    var presenter: MoviesPresenterViewProtocol!
    private var uiView = MoviesViewUI()
    
    override func loadView() {
       // TODO: complete here
        title = "Movies"
        view = uiView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.start()
    }
}

extension MoviesView: MoviesViewPresenterProtocol {
    // handle response of presenter.
}
