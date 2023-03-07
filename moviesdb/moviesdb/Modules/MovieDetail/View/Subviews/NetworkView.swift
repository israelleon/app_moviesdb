//
//  NetworkView.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 06/03/23.
//

import UIKit

class NetworkView: UIView {
    
    private var dataSource: [MovieDetailNetworkProtocol] = [] {
        didSet {
            DispatchQueue.main.async { [weak collectionView ] in
                collectionView?.reloadData()
            }
        }
    }
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        setupConstranits()
    }
    
    private func setupUI() {
        subviews.forEach {$0.removeFromSuperview()}
        addSubview(collectionView)
    }
    
    private func setupConstranits() {
        collectionView.fitTo(self)
    }
}

extension NetworkView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       return CGSize(width: 100, height: 100)
    }
}

extension NetworkView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return UICollectionViewCell()
    }
}
