//
//  TwoColumnViewController.swift
//  Ornament
//
//  Created by Anastasia on 09.12.2021.
////  Controller for Categories of Check-up

import UIKit

class TwoColumnViewController: UIViewController {
    
    let items = [
        "🔥Популярные",
        "🦠Covid-19"
        ]
    
    enum Section {
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    var collectionView: UICollectionView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureDataSource()

    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let trailingItem1 = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4),
                                                   heightDimension: .fractionalHeight(1.0)))
            trailingItem1.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 10)
            
            let trailingItem2 = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                   heightDimension: .fractionalHeight(1.0)))
            trailingItem2.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 24)
            
            let trailingItem2Group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6),
                                                   heightDimension: .fractionalHeight(1.0)),
                subitem: trailingItem2, count: 2)
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .fractionalHeight(1.5)),
                subitems: [trailingItem1, trailingItem2Group])
            
            let section = NSCollectionLayoutSection(group: group)
            
            return section
        }
        return layout
    }
    
    private func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        let nib = UINib(nibName: DummyCell.reuseIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: DummyCell.reuseIdentifier)
        view.addSubview(collectionView)
        collectionView.isScrollEnabled = false

    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DummyCell.reuseIdentifier, for: indexPath) as? DummyCell else { fatalError("Cannot create the cell") }
            
            cell.layer.cornerRadius = 7.0
            cell.textLabel.text = self.items[indexPath.row]
            
            return cell
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(0..<items.count))
        dataSource.apply(snapshot, animatingDifferences: false)

    }
}
