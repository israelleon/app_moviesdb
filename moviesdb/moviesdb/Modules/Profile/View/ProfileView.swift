//
//  ProfileView.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 04/03/23.
//

import UIKit

class ProfileView: UIViewController, ViewProtocol {
    var presenter: ProfilePresenterViewProtocol!
    private var uiView = MoviesViewUI()
    
    override func loadView() {
       // TODO: complete here
        title = "Profile"
        view = uiView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.start()
    }
}

extension ProfileView: ProfileViewPresenterProtocol {
    // handle response of presenter.
}
