//
//  MovieViewUI.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//

import UIKit

fileprivate struct Constants {
    static let stackViewSpacing: CGFloat = 16
    static let stackViewEdgeInset = UIEdgeInsets(top: 16, left: 16, bottom: 0, right: -16)
    
    static let segmentedHeight: CGFloat = 30

}

protocol MoviesViewUIDelegate: AnyObject {
    func didSelectItem(at indexPath: IndexPath, in category: MovieCategory)
}

protocol MoviesViewUIDataSource: AnyObject {
    // mapping to addChild method in UIViewController
    func addChild(_ controller: UIViewController)
    func didMove(_ controller: UIViewController)
    func objectForView(view: MoviesViewUI, with category: MovieCategory) -> MovieCategoryEntity?
    var categories: [MovieCategory] { get }
}

class MoviesViewUI: UIView {
    weak var delegate: MoviesViewUIDelegate?
    weak var datasource: MoviesViewUIDataSource? {
        didSet {
            setupUI()
        }
    }
    
    private lazy var stackView: UIStackView = {
        UIStackView.build(axis: .vertical, spacing: Constants.stackViewSpacing)
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: datasource?.categories.map{ $0.title } ?? [])
        control.translatesAutoresizingMaskIntoConstraints = false
        control.selectedSegmentIndex = 0
        control.backgroundColor = .segmentedInactive
        control.selectedSegmentTintColor = .segmentedActive
        control.addTarget(self, action: #selector(didChangeValueSegmentedControl(_:)), for: .valueChanged)
        control.defaultConfiguration()
        control.selectedConfiguration()
        return control
    }()
    
    private lazy var pageController: PageControlProtocol = {
        let pageController = MoviesPageController(numberOfPages: datasource?.categories.count ?? 0)
        pageController.view.translatesAutoresizingMaskIntoConstraints = false
        pageController.pageDelegate = self
        return pageController
    }()
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        setupConstraints()
    }
    
    private func setupUI() {
        subviews.forEach{$0.removeFromSuperview()}
        backgroundColor = .background
        stackView.addArrangedSubviews([segmentedControl, pageController.view])
        addSubview(stackView)
        datasource?.addChild(pageController)
        datasource?.didMove(pageController)
    }
    
    private func setupConstraints() {
        stackView.fitToSafeArea(self, edgeInset: Constants.stackViewEdgeInset)
        NSLayoutConstraint.activate([
            segmentedControl.heightAnchor.constraint(equalToConstant: Constants.segmentedHeight)
        ])
    }
    
    @objc private func didChangeValueSegmentedControl(_ sender: UISegmentedControl) {
        pageController.setPage(sender.selectedSegmentIndex)
    }
    
    func reloadData(with category: MovieCategory) {
        if let categoryData = datasource?.objectForView(view: self, with: category) {
            pageController.moviePage(at: category.rawValue)?.reload(by: categoryData)
        }
    }
}


extension MoviesViewUI: MoviesPageDelegate {
    func didSelectItem(at indexPath: IndexPath, at pageIndex: Int) {
        guard let category = MovieCategory(rawValue: pageIndex) else { return }
        delegate?.didSelectItem(at: indexPath, in: category)
    }
    
    func didChangePage(page: UIViewController, at index: Int) {
        if segmentedControl.selectedSegmentIndex != index {
            segmentedControl.selectedSegmentIndex = index
        }
    }
}
