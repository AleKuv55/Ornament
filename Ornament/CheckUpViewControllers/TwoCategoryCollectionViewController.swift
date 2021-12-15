////
////  TwoCategoryCollectionViewController.swift
////  Ornament
////
////  Created by Anastasia on 16.12.2021.
////
//
//import UIKit
//
////private let reuseIdentifier = "Cell"
//
//class TwoCategoryCollectionViewController: UICollectionViewController {
//
//    let items = [
//        "🔥Популярные",
//        "🦠Covid-19"
//    ]
//
//    enum Section {
//        case main
//    }
//
//    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
//    var collectionView: UICollectionView! = nil
//
//    init?(coder: NSCoder, category: [String]) {
//        self.items = category
//        super.init(coder: coder)
//        }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        navigationItem.title = "Categories of check-ups"
//        configureHierarchy()
//        configureDataSource()
//    }
//
//    private func createLayout() -> UICollectionViewLayout {
//        let spacing: CGFloat = 10
//        let itemSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(0.33),
//            heightDimension: .fractionalHeight(0.7))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        item.contentInsets = .init(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
//
//        let groupSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .fractionalWidth(0.2))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//
//        let section = NSCollectionLayoutSection(group: group)
//        let layout = UICollectionViewCompositionalLayout(section: section)
//        return layout
//    }
//
//    private func configureHierarchy() {
//        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
//        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        collectionView.backgroundColor = .systemBackground
//        let nib = UINib(nibName: DummyCell.reuseIdentifier, bundle: nil)
//        collectionView.register(nib, forCellWithReuseIdentifier: DummyCell.reuseIdentifier)
//        view.addSubview(collectionView)
////        collectionView.delegate = self
//    }
//
//    private func configureDataSource() {
//        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView) {
//            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
//
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DummyCell.reuseIdentifier, for: indexPath) as? DummyCell else { fatalError("Cannot create the cell") }
//
//            cell.layer.cornerRadius = 7.0
//            cell.textLabel.text = self.items[indexPath.row]
//            cell.backgroundColor = .lightGray
//            return cell
//        }
//
//        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
//        snapshot.appendSections([.main])
//        snapshot.appendItems(Array(0..<items.count))
//        dataSource.apply(snapshot, animatingDifferences: false)
//    }
//
//}
