//
//  CheckUpCollectionViewCell.swift
//  Ornament
//
//  Created by Anastasia on 19.12.2021.
//

import UIKit

class CheckUpCollectionViewCell: UICollectionViewCell {
    
    let checkUpTitle: [String]
    
    init?(coder: NSCoder, checkUpName: [String]) {
        self.checkUpTitle = checkUpName
        super.init(coder: coder)
        addSubviews()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let viewContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    private let checkUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Ежегодная проверка"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    
    private func addSubviews() {
        contentView.addSubview(viewContainer)
        contentView.addSubview(checkUpLabel)
        
        self.contentView.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func upd(checkUpLabelData: String) {
        self.checkUpLabel.text = checkUpLabelData
    }
    
    func setupConstraint() {
    [
        viewContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
        viewContainer.topAnchor.constraint (equalTo: self.contentView.topAnchor),
        viewContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        viewContainer.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),

        checkUpLabel.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 32),
        checkUpLabel.topAnchor.constraint (equalTo: viewContainer.topAnchor, constant: 32),
        checkUpLabel.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),
        checkUpLabel.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor, constant: -32),
    ].forEach { $0.isActive = true }
        super.updateConstraints()
        
    }
}
