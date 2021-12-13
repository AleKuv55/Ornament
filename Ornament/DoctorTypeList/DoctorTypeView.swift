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
        label.text = "Записаться"
        label.textColor = .black
        label.font = label.font.withSize(20)
        label.textAlignment = .center
    
        return label
    }()

    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        backgroundColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        //стоит ли наследовать от UIViewCell, чтобы потом добавить contentView и норм обрабатывать нажатия
        addSubview(headerLabel)
        addSubview(tableView)
        self.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }


    }
    override func updateConstraints(){
        [
             headerLabel.leadingAnchor.constraint (equalTo: self.leadingAnchor, constant: 0),
             headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 148),
             tableView.topAnchor.constraint (equalTo: headerLabel.bottomAnchor, constant: 0),
             tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
             tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
             tableView.bottomAnchor.constraint (equalTo: self.bottomAnchor)
        ].forEach { $0.isActive = true }
        
         super.updateConstraints ()
    }
    

}
