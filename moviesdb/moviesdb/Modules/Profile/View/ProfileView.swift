//
//  ProfileView.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 04/03/23.
//

import UIKit

fileprivate struct Constants {
    static let title = "profile.title"
}

class ProfileView: UIViewController, ViewProtocol {
    var presenter: ProfilePresenterViewProtocol!
    
    private var uiView = ProfileViewUI()
    private var object: ProfileEntity?
    
    override func loadView() {
        title = Constants.title
        uiView.datasource = self
        uiView.delegate = self
        view = uiView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.start()
    }
}

extension ProfileView: ProfileViewPresenterProtocol {
    func renderBy(entity: ProfileEntity) {
        object = entity
        DispatchQueue.main.async { [weak uiView] in
            uiView?.reload()
        }
    }
}

extension ProfileView: ProfileViewUIDelegate {
    func didSelectItem(id: Int) {
        presenter.presentMovieDetail(id: id)
    }
}

extension ProfileView: ProfileViewUIDatasource {
    func objectFor(view: ProfileViewUI) -> ProfileEntity? {
        return object
    }
}
