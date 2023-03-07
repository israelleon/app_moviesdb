//
//  ProfileViewUI.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 04/03/23.
//

import UIKit

fileprivate struct Constants {
    static let contentStackSpacing: CGFloat = 16
    static let title = "profile.title".localized
    static let section = "profile.section".localized
    
    static let titleHeight: CGFloat = 60
    static let sectioHeight: CGFloat = 40
    static let moviesListHeight: CGFloat = 340
    static let contentStackEdgeInset = UIEdgeInsets(top: 16, left: 16, bottom: -16, right: -16)
}

protocol ProfileViewUIDelegate: AnyObject {
    func didSelectItem(id: Int)
}

protocol ProfileViewUIDatasource: AnyObject {
    func objectFor(view: ProfileViewUI) -> ProfileEntity?
}

class ProfileViewUI: UIView {
    
    weak var datasource: ProfileViewUIDatasource?
    weak var delegate: ProfileViewUIDelegate?
    private var object: ProfileEntity?
    
    private let profileView: CircleProfileView = {
        let view = CircleProfileView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let contentStackview = UIStackView.build(axis: .vertical, spacing: Constants.contentStackSpacing)
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel.build(textColor: .main)
        label.text = Constants.title
        return label
    }()
    
    private lazy var sectionLabel: UILabel = {
        let label = UILabel.build(textColor: .main)
        label.text = Constants.section
        return label
    }()
   
    private lazy var movieListView: MovieListView = {
        let view = MovieListView(direction: .horizontal)
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("MoviesViewUI.\(#function) coder exception")
    }
    
    private func setupUI() {
        backgroundColor = .background
        contentStackview.addArrangedSubviews([titleLabel, profileView, sectionLabel, movieListView])
        addSubview(contentStackview)
    }
    
    private func setupContraints() {
        contentStackview.fitToSafeArea(self, edgeInset: Constants.contentStackEdgeInset)
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: Constants.titleHeight),
            sectionLabel.heightAnchor.constraint(equalToConstant: Constants.sectioHeight),
            movieListView.heightAnchor.constraint(equalToConstant: Constants.moviesListHeight)
        ])
    }
    
    func reload() {
        object = datasource?.objectFor(view: self)
        guard let category = object?.category else { return }
        movieListView.dataSource = category.tvShows.map { MovieTvShowItemDTO(movieItem: $0) }
        profileView.configure(with: object?.username, and: object?.image)
    }
}

extension ProfileViewUI: MovieListDelegate {
    func didSelectItem(at indexPath: IndexPath, object: CardMovieModel) {
        delegate?.didSelectItem(id: object.id)
    }
}
