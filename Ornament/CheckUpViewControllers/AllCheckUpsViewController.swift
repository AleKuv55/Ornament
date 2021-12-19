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
        "Спортсменам",
        "Постковидный чекап",
        "Проверка после праздников",
        "Тест на антитела",
        "Диетологический чекап",
        "Микроэлементы и витамины"
    ]
    
    let checkUp1: CheckUpDataModel = CheckUpDataModel(checkUpName: "Ежегодная проверка",
                                                      infoArray: ["Ещё не были на ежегодной проверке или редко находите время, чтобы сходить к врачу",
                                                      "Спите меньше 8 часов или часто перекусываете, не налажен рацион",
                                                      "Ведете сидячий образ жизни или проходите менее 2000 шагов"])

    let checkUp2: CheckUpDataModel = CheckUpDataModel(checkUpName: "Спортсменам",
                                                      infoArray: ["Если хотите участвовать в официальных спортивных мероприятиях",
                                                      "Начинаете или ведете интенсивные тренировки в спортзале",
                                                      "Собираетесь резко увеличить нагрузку"])

    let checkUp3: CheckUpDataModel = CheckUpDataModel(checkUpName: "Постковидный чекап",
                                                      infoArray: ["Переболели ковидом с симптомами или думаете, что перенесли вирус бессимптомно",
                                                      "Периодически мучает учащенное сердцебиение или вам кажется, что сердце бьётся как-то не так",
                                                      "Появилась одышка даже при небольших нагрузках, например прогулке"])

    let checkUp4: CheckUpDataModel = CheckUpDataModel(checkUpName: "Проверка после праздников",
                                                      infoArray: ["Ваше самочувствие после праздников ухудшилось",
                                                      "У вас есть симптомы расстройства печени (слабость, потеря аппетита, боли в животе и др.)",
                                                      "У вас повышен холестерин или есть хронические заболевания печени"])

    let checkUp5: CheckUpDataModel = CheckUpDataModel(checkUpName: "Тест на антитела",
                                                      infoArray: ["Вы переболели коронавирусом – с симптомами или без",
                                                      "Думаете, что переболели коронавирусом",
                                                      "Хотите знать количество антител, чтобы стать донором или сделать прививку"])

    let checkUp6: CheckUpDataModel = CheckUpDataModel(checkUpName: "Диетологический чекап",
                                                      infoArray: ["Не болеете, но чувствуете себя не очень",
                                                      "Хотите улучшить свой рацион",
                                                      "Хотите быть в тренде"])

    let checkUp7: CheckUpDataModel = CheckUpDataModel(checkUpName: "Микроэлементы и витамины",
                                                      infoArray: ["Ограничиваете себя в продуктах из-за аллергий, диет и другого",
                                                      "Ломаются ногти, секутся волосы, кожа стала хуже",
                                                      "Ослабленный иммунитет, усталость и депрессивность"])
    
    var checkUpList: [CheckUpDataModel] = []

    
    enum Section {
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    var collectionView: UICollectionView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureDataSource()
        checkUpList.append(contentsOf: [checkUp1,
                                        checkUp2,
                                        checkUp3,
                                        checkUp4,
                                        checkUp5,
                                        checkUp6,
                                        checkUp7
                                       ])
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
        // leading - left, trailing - right
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
        collectionView.delegate = self
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

extension AllCheckUpsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = CheckUpInfoViewController(checkUp: checkUpList[indexPath.item])
        self.navigationController?.pushViewController(viewController, animated: true)
        print("didSelectItemAt")
    }
}
