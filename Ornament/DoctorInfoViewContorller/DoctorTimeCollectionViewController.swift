//
//  DoctorTimeViewController.swift
//  Ornament
//
//  Created by Alexandr Kuznetsov on 09.12.2021.
//

import UIKit

class DoctorTimeCollectionViewController: UIViewController {
 
    enum Section {
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    var collectionView: UICollectionView! = nil
    
    let doctorTime:[String]

    init?(coder: NSCoder, doctorTime: [String]) {
        self.doctorTime = doctorTime
        super.init(coder: coder)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Doctor Info"
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
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        let nib = UINib(nibName: DummyCell.reuseIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: DummyCell.reuseIdentifier)
        view.addSubview(collectionView)
        collectionView.delegate = self

    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DummyCell.reuseIdentifier, for: indexPath) as? DummyCell else { fatalError("Cannot create the cell") }
            
//            cell.textLabel.text = "\(identifier)"
            cell.layer.cornerRadius = 7.0
            cell.textLabel.text = self.doctorTime[indexPath.row]
            cell.backgroundColor = .lightGray
            return cell
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(0..<doctorTime.count))
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}
    
extension DoctorTimeCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! DummyCell
        let alert = UIAlertController(title: "Уверены?", message: "Запись на прием на " + cell.textLabel.text! , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Да", comment: "Default action"), style: .default, handler: someHandler))
        alert.addAction(UIAlertAction(title: NSLocalizedString("Нет", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        })
        )
        self.present(alert, animated: true, completion: nil)
        
    }
    func someHandler(alert: UIAlertAction!) {
        let alertNew = UIAlertController(title: "Вы записаны!", message: "" , preferredStyle: .alert)
        alertNew.addAction(UIAlertAction(title: "Далее", style: .cancel, handler: { UIAlertAction in
        }))
        self.present(alertNew, animated: true, completion: nil)
    }
}
