//
//  SettingsMenuView.swift
//  Ornament
//
//  Created by Anastasia on 15.12.2021.
//

import UIKit

class SettingsMenuView: UIView {
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Настройки"
        label.textColor = .black
        label.font = label.font.withSize(40)
        label.textAlignment = .left
        label.font = label.font.bold
        return label
    }()
    
    let tableView = UITableView() // settings (О проекте, связаться с нами .. )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(headerLabel)
        addSubview(tableView)
        self.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        updConstraint()
    }
    
    func updConstraint(){
        [
            headerLabel.leadingAnchor.constraint (equalTo: self.leadingAnchor, constant: 20),
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 148),
            
            tableView.leadingAnchor.constraint (equalTo: self.leadingAnchor, constant: 20),
            tableView.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 24),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 30),
            
        ].forEach { $0.isActive = true }
         super.updateConstraints ()
    }
}
