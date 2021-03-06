//
//  DoctorTypeView.swift
//  Ornament
//
//  Created by Alexandr Kuznetsov on 21.11.2021.
//

import UIKit

class DoctorTypeView: UIView {

    private let headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = label.font.withSize(40)
        label.textAlignment = .left
        label.text = "Записаться к врачу"
        label.font = label.font.bold
        return label
    }()
    
    private let subLabel: UILabel = {
        let label = UILabel()
        label.text = "Только лучшие специалисты"
        label.textColor = .lightGray
        label.font = label.font.withSize(20)
        label.textAlignment = .left
//        label.font = label.font.bold
        return label
    }()

    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
//        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        //стоит ли наследовать от UIViewCell, чтобы потом добавить contentView и норм обрабатывать нажатия
        addSubview(headerLabel)
        addSubview(tableView)
        addSubview(subLabel)
        self.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        UpdateConstraints()

    }
    func UpdateConstraints(){
        [
            
            headerLabel.leadingAnchor.constraint (equalTo: self.leadingAnchor, constant: 20),
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 148),
            
            subLabel.leadingAnchor.constraint (equalTo: self.leadingAnchor, constant: 20),
            subLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 4),
            subLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            subLabel.bottomAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 30),
            
             tableView.topAnchor.constraint (equalTo: subLabel.bottomAnchor, constant: 20),
             tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
             tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
             tableView.bottomAnchor.constraint (equalTo: self.bottomAnchor)
            
        ].forEach { $0.isActive = true }
        
         super.updateConstraints ()
    }
    

}


