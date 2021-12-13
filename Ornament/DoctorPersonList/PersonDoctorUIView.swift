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
        label.font = label.font.withSize(25)
//        label.font.
        //        label.backgroundColor = .none
        label.textAlignment = .center
        return label
    }()

    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
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
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            headerLabel.trailingAnchor.constraint (equalTo: self.trailingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 148),
//             headerLabel.leadingAnchor.constraint (equalTo: self.leadingAnchor),
//             headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 88),
             tableView.topAnchor.constraint (equalTo: headerLabel.bottomAnchor, constant: 0),
             tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
             tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
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
