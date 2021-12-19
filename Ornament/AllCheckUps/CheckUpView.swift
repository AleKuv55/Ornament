//
//  CheckUpView.swift
//  Ornament
//
//  Created by Anastasia on 19.12.2021.
//

import UIKit

class CheckUpView: UIView {

    private let headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = label.font.withSize(30)
        label.textAlignment = .left
        label.text = "Выберете чекап"
        label.numberOfLines = 0
        label.font = label.font.bold
        return label
    }()
    
    let collectionView = UICollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(headerLabel)
        addSubview(collectionView)
        self.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        updConstr()
    }
    
    func updConstr() {
        [
            headerLabel.leadingAnchor.constraint (equalTo: self.leadingAnchor, constant: 20),
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 148),
            
            collectionView.leadingAnchor.constraint (equalTo: self.leadingAnchor, constant: 20),
            collectionView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ].forEach { $0.isActive = true }
         super.updateConstraints ()
    }
}
