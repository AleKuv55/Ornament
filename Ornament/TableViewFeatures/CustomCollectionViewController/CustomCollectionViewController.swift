//
//  CustomCollectionViewController.swift
//  Ornament
//
//  Created by Anastasia on 21.11.2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class CustomCollectionViewController: UICollectionViewController {
    
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

    let columnLayout = CustomFlowLayout(
        cellsPerRow: 2,
        minimumInteritemSpacing: 10,
        minimumLineSpacing: 10,
        sectionInset: UIEdgeInsets(top: 10, left: 24, bottom: 10, right: 24)
    )
    

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.collectionViewLayout = columnLayout
        collectionView?.contentInsetAdjustmentBehavior = .always
        collectionView?.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    // don't work
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 120)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCollectionViewCell
        cell.layer.cornerRadius = 7.0
        cell.checkUpLabel.text = items[indexPath.row]
        return cell
    }
    
    
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        collectionView?.collectionViewLayout.invalidateLayout()
//        super.viewWillTransition(to: size, with: coordinator)
//    }
}

extension CustomCollectionViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 50, height: 50)
//    }
}
