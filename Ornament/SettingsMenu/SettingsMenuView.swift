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
        label.text = "Профиль"
        label.textColor = .black
        label.font = label.font.withSize(40)
        label.textAlignment = .left
        label.font = label.font.bold
        return label
    }()
    
    let tableView1 = UITableView() // profile info (photo, name and surname)
    let tableView2 = UITableView() // settings (О проекте, связаться с нами .. )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(headerLabel)
        addSubview(tableView1)
        addSubview(tableView2)
        self.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        updateConstraints()
    }
    
    override func updateConstraints(){
        [
            headerLabel.leadingAnchor.constraint (equalTo: self.leadingAnchor, constant: 20),
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 148),
            
            tableView1.leadingAnchor.constraint (equalTo: self.leadingAnchor, constant: 20),
            tableView1.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 24),
            tableView1.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView1.bottomAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 30),
            
            tableView2.topAnchor.constraint (equalTo: tableView1.bottomAnchor, constant: 4),
            tableView2.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            tableView2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            tableView2.bottomAnchor.constraint (equalTo: self.bottomAnchor)
            
            
        ].forEach { $0.isActive = true }
         super.updateConstraints ()
    }
}
