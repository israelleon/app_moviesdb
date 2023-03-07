//
//  MovieView.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import UIKit

fileprivate struct Constants {
    static let title = "movies.title".localized
}

class MoviesView: UIViewController, ViewProtocol {
    var presenter: MoviesPresenterViewProtocol!
    private var uiView = MoviesViewUI()
    
    override func loadView() {
        uiView.datasource = self
        uiView.delegate = self
        view = uiView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRightButonIcon(.listBullet, onTap: #selector(didPressedMenuButton(_:)))
        title = Constants.title
        presenter.start()
    }
    
    @objc func didPressedMenuButton(_ sender: Any) {
        presenter.presentMenu()
    }
}

extension MoviesView: MoviesViewPresenterProtocol {
    func render(category: MovieCategory) {
        DispatchQueue.main.async { [weak uiView] in
            uiView?.reloadData(with: category)
        }
    }
}

extension MoviesView: MoviesViewUIDataSource {
    func objectForView(view: MoviesViewUI, with category: MovieCategory) -> MovieCategoryEntity? {
        presenter.getDatasource(from: category)
    }
    
    var categories: [MovieCategory] {
        return presenter.categories
    }
    
    func didMove(_ controller: UIViewController) {
        controller.didMove(toParent: self)
    }
}

extension MoviesView : MoviesViewUIDelegate {
    func didSelectItem(at indexPath: IndexPath, in category: MovieCategory) {
        presenter.presentDetails(category: category, at: indexPath)
    }
}
