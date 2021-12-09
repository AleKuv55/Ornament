//
//  AllCheckUpsViewController.swift
//  Ornament
//
//  Created by Anastasia on 09.12.2021.
//

import UIKit

class AllCheckUpsViewController: UIViewController {
    
    let items = [
        "Ежегодная проверка",
        "Постковидный чекап",
        "Спотрсменам",
        "Диетологический чекап",
        "Планирование беременности",
        "ПЦР-тест на коронавирус",
        "Тест на антитела",
        "Экспресс-тест на коронавирус на дому",
        "Микроэлементы и витамины",
        "Проверка диабета",
        "Щитовидная железа",
        "Суставы",
        "Система пищеварения"
    ]
    
    enum Section {
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    var collectionView: UICollectionView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "All Check-up"
        configureHierarchy()
        configureDataSource()

    }
    
    private func createLayout() -> UICollectionViewLayout {
        
        let spacing: CGFloat = 10

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(170),
            heightDimension: .absolute(120))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(120))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(spacing)

        let section = NSCollectionLayoutSection(group: group)
        // leading - boarders of group, trailing - between items
        section.contentInsets = .init(top: 10, leading: 24, bottom: 10, trailing: 24)
        section.interGroupSpacing = spacing
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        let nib = UINib(nibName: CheckUpCell.reuseIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: CheckUpCell.reuseIdentifier)
        view.addSubview(collectionView)
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CheckUpCell.reuseIdentifier, for: indexPath) as? CheckUpCell else { fatalError("Cannot create the cell") }
            
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
