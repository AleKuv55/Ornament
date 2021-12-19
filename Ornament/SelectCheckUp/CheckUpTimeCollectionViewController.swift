//
//  CheckUpTimeCollectionViewController.swift
//  Ornament
//
//  Created by Anastasia on 20.12.2021.
//

import UIKit

class CheckUpTimeCollectionViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    var collectionView2: UICollectionView! = nil
    
    let checkupTime: [String]

    init?(coder: NSCoder, checkUpTime: [String]) {
        self.checkupTime = checkUpTime
        super.init(coder: coder)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureDataSource()
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 10
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.33),
            heightDimension: .fractionalHeight(0.7))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func configureHierarchy() {
        collectionView2 = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView2.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView2.backgroundColor = .systemBackground
        let nib = UINib(nibName: DummyCell.reuseIdentifier, bundle: nil)
        collectionView2.register(nib, forCellWithReuseIdentifier: DummyCell.reuseIdentifier)
        view.addSubview(collectionView2)
        collectionView2.delegate = self

    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView2) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DummyCell.reuseIdentifier, for: indexPath) as? DummyCell else { fatalError("Cannot create the cell") }
    
            cell.layer.cornerRadius = 7.0
            cell.textLabel.text = self.checkupTime[indexPath.row]
            cell.backgroundColor = .lightGray
            return cell
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(0..<checkupTime.count))
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension CheckUpTimeCollectionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView2.cellForItem(at: indexPath) as! DummyCell
        let alert = UIAlertController(title: "Уверены?", message: "Запись на прием на " + cell.textLabel.text! , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Да", comment: "Default action"), style: .default, handler: Handler))
        alert.addAction(UIAlertAction(title: NSLocalizedString("Нет", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        })
        )
        self.present(alert, animated: true, completion: nil)
    }
    
    func Handler(alert: UIAlertAction!) {
        let alertNew = UIAlertController(title: "Вы записаны!", message: "" , preferredStyle: .alert)
        alertNew.addAction(UIAlertAction(title: "Далее", style: .cancel, handler: { UIAlertAction in
        }))
        self.present(alertNew, animated: true, completion: nil)
    }
}

