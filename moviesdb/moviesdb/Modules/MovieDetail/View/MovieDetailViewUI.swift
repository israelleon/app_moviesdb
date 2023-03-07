//
//  MovieDetailViewUI.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 04/03/23.
//

import UIKit

protocol MovieDetailViewUIDatasource: AnyObject {
    func objectFor(view: MovieDetailViewUI) -> MovieDetailEntity?
}

protocol MovieDetailViewUIDelegate: AnyObject {
}

class MovieDetailViewUI: UIView {
    
    weak var delegate: MovieDetailViewUIDelegate?
    weak var datasource: MovieDetailViewUIDatasource?
    
    private var elements: [MoviewDetailSection] = [] {
        didSet {
            DispatchQueue.main.async { [weak tableView] in
                tableView?.reloadData()
            }
        }
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.registerCell(GenericTableViewCell<BannerView>.self)
        tableView.registerCell(GenericTableViewCell<MovieRemarksView>.self)
        tableView.registerCell(GenericTableViewCell<CastView>.self)
        tableView.registerCell(GenericTableViewCell<MovieListView>.self)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("MoviesViewUI.\(#function) coder exception")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        setupConstraints()
    }
    
    private func setupUI() {
        backgroundColor = .cardBackground
        subviews.forEach{ $0.removeFromSuperview() }
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.fitToSafeArea(self)
    }
    
    func reload() {
        let object = datasource?.objectFor(view: self)
        elements = object?.sections ?? []
    }
}

extension MovieDetailViewUI: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard elements.count > section else { return 0 }
        return elements[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard elements.count > indexPath.section,
              elements[indexPath.section].items.count > indexPath.row else {
            return UITableViewCell()
        }
        let item = elements[indexPath.section].items[indexPath.row]
        switch item.type {
        case .banner:
            let cell: GenericTableViewCell<BannerView>  = tableView.dequeueCell(at: indexPath)
            if let model = item as? MovieDetailsBannerProtocol {
                cell.uiView.configure(with: model.title, bannerURL: model.posterURL)
            }
            return cell
        case .content:
            let cell: GenericTableViewCell<MovieRemarksView> = tableView.dequeueCell(at: indexPath)
            if let model = item as? MovieDetailsContentProtocol {
                cell.uiView.setTitle(title: model.body, color: model.color)
            }
            return cell
        case .cast:
            let cell: GenericTableViewCell<CastView> = tableView.dequeueCell(at: indexPath)
            return cell
        case .network:
            let cell: GenericTableViewCell<MovieListView> = tableView.dequeueCell(at: indexPath)
            cell.uiView.update(direction: .horizontal)
            if let model = item as? MovieDetailNetworkProtocol {
                cell.uiView.dataSource = model.items
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard elements.count > indexPath.section,
              elements[indexPath.section].items.count > indexPath.row else {
            return UITableView.automaticDimension
        }
        let item = elements[indexPath.section].items[indexPath.row]
        if item.type == .network { return 300 }
        return UITableView.automaticDimension
    }
}

extension MovieDetailViewUI: UITableViewDelegate {
    
}
