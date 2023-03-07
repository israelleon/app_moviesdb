//
//  MovieListView.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 04/03/23.
//

import UIKit

fileprivate struct Constants {
    static let cellHeight: CGFloat = 320
    static let numberOfColumns: Int = 2
    static let minimunLineSpacingForSection: CGFloat = 8
    static let minimumInteritemSpacingForSection: CGFloat = 16
    static let edgeinsetForSection = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
}

protocol MovieListDelegate: AnyObject {
    func didSelectItem(at indexPath: IndexPath, object: CardMovieModel)
}

class MovieListView: UIView, ReusableView {
    private var direction: UICollectionView.ScrollDirection = .vertical
    weak var delegate: MovieListDelegate?
    var dataSource: [CardMovieModel] = [] {
        didSet {
            DispatchQueue.main.async { [weak collectionView] in
                collectionView?.reloadData()
            }
        }
    }
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: buildFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.registeCell(GenericCollectionViewCell<CardMovieView>.self)
        return collectionView
    }()
    
    convenience init(direction: UICollectionView.ScrollDirection) {
        self.init()
        self.direction = direction
        self.collectionView.collectionViewLayout = buildFlowLayout()
    }
    
    func update(direction: UICollectionView.ScrollDirection) {
        self.direction = direction
        self.collectionView.collectionViewLayout = buildFlowLayout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal override func didMoveToWindow() {
        super.didMoveToWindow()
        setupConstraints()
    }
    
    private func setupUI() {
        subviews.forEach { $0.removeFromSuperview() }
        addSubview(collectionView)
    }
    
    private func setupConstraints() {
        collectionView.fitTo(self)
    }
    
    private func buildFlowLayout() -> UICollectionViewFlowLayout {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = direction
        flowlayout.sectionInset = Constants.edgeinsetForSection
        flowlayout.minimumLineSpacing = Constants.minimunLineSpacingForSection
        flowlayout.minimumInteritemSpacing = Constants.minimumInteritemSpacingForSection
        return flowlayout
    }
}

extension MovieListView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: GenericCollectionViewCell<CardMovieView> = collectionView.dequeueCell(at: indexPath)
        if dataSource.count > indexPath.row {
            cell.uiView.config(with: dataSource[indexPath.row])
        }
        return cell
    }
}

extension MovieListView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard dataSource.count > indexPath.row else {return}
        delegate?.didSelectItem(at: indexPath, object:  dataSource[indexPath.row])
    }
}

extension MovieListView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let width: CGFloat = (collectionView.frame.size.width - space) / CGFloat(Constants.numberOfColumns)
        return CGSize(width: width, height: Constants.cellHeight)
    }
}

