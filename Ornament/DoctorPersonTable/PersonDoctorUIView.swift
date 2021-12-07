//
//  PersonDoctorUIView.swift
//  Ornament
//
//  Created by Alexandr Kuznetsov on 22.11.2021.
//

import UIKit

class PersonDoctorUIView: UIView {
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Свободные врачи"
        label.textColor = .black
        label.backgroundColor = .gray
        label.textAlignment = .center
        return label
    }()

    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
//        backgroundColor = .gray
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
        UpdateConstraints()


    }
    func UpdateConstraints(){
        [
             headerLabel.leadingAnchor.constraint (equalTo: self.leadingAnchor),
             headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 88),
             tableView.topAnchor.constraint (equalTo: headerLabel.bottomAnchor, constant: 24),
             tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
             tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
             tableView.bottomAnchor.constraint (equalTo: self.bottomAnchor)
        ].forEach { $0.isActive = true }
        
//         super.updateConstraints ()
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
