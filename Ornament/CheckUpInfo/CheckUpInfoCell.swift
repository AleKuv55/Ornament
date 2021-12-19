//
//  CheckUpInfoCell.swift
//  Ornament
//
//  Created by Anastasia on 19.12.2021.
//

import UIKit

class CheckUpInfoCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let viewContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    private let checkUpInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Для поддержания здоровья"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    
    private func addSubviews () {
        contentView.addSubview(viewContainer)
        contentView.addSubview(checkUpInfoLabel)

        self.contentView.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func update(checkUpData: String) {
        self.checkUpInfoLabel.text = checkUpData
    
    }
    
    func setupConstraints() {
    [
        viewContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
        viewContainer.topAnchor.constraint (equalTo: self.contentView.topAnchor),
        viewContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        viewContainer.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),

        checkUpInfoLabel.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 32),
        checkUpInfoLabel.topAnchor.constraint (equalTo: viewContainer.topAnchor, constant: 32),
        checkUpInfoLabel.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),
        checkUpInfoLabel.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor, constant: -32),

   ].forEach { $0.isActive = true }
        super.updateConstraints()
    }
}
