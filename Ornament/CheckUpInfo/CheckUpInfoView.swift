//
//  CheckUpInfoView.swift
//  Ornament
//
//  Created by Anastasia on 19.12.2021.
//

import UIKit

class CheckUpInfoView: UIView {

    private let headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = label.font.withSize(30)
        label.textAlignment = .left
        label.text = "Описание чекапа"
        label.numberOfLines = 0
        label.font = label.font.bold
        return label
    }()
    
    private let subLabel: UILabel = {
        let label = UILabel()
        label.text = "нужен, если ..."
        label.textColor = .lightGray
        label.font = label.font.withSize(20)
        label.textAlignment = .left
        return label
    }()
    
    let tableView = UITableView()
    
    private let selectCheckUp: UILabel = {
        let label = UILabel()
        label.text = "Записаться"
        label.textColor = .white
        label.font = label.font.withSize(30)
        label.textAlignment = .center
        label.backgroundColor = .systemBlue
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updHeader(updHead: String) {
        headerLabel.text = updHead
    }
    
    private func addSubviews() {
        addSubview(headerLabel)
        addSubview(subLabel)
        addSubview(tableView)
        addSubview(selectCheckUp)
        self.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        updConstraints()
    }
    
    func updConstraints(){
        [
            headerLabel.leadingAnchor.constraint (equalTo: self.leadingAnchor, constant: 20),
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 148),
            
            subLabel.leadingAnchor.constraint (equalTo: self.leadingAnchor, constant: 20),
            subLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            subLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            subLabel.bottomAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 50),
            
            tableView.topAnchor.constraint (equalTo: subLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint (equalTo: self.bottomAnchor),
            
            selectCheckUp.topAnchor.constraint (equalTo: self.bottomAnchor, constant: -120),
            selectCheckUp.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            selectCheckUp.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            selectCheckUp.bottomAnchor.constraint (equalTo: self.bottomAnchor, constant: -70),
            
        ].forEach { $0.isActive = true }
        
         super.updateConstraints ()
    }
    
}
