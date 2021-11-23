//
//  DoctorTypeTableViewCell.swift
//  Ornament
//
//  Created by Alexandr Kuznetsov on 21.11.2021.
//

import UIKit
struct CellDataModel {
    let title: String
    let isCompleted: Bool
}

class DoctorTypeTableViewCell: UITableViewCell {
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")}
        
    private let viewContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    private let doctorTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Терапевт"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    
    private func addSubviews () {
        contentView.addSubview(viewContainer)
        contentView.addSubview(doctorTypeLabel)

        self.contentView.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    func update(type:String) {
        self.doctorTypeLabel.text = type
    }
    //
    func setupConstraints() {
    [
        viewContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
        viewContainer.topAnchor.constraint (equalTo: self.contentView.topAnchor),
        viewContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
//        viewContainer.heightAnchor.constraint(equalToConstant: 141),

        viewContainer.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),

        doctorTypeLabel.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 32),
        doctorTypeLabel.topAnchor.constraint (equalTo: viewContainer.topAnchor, constant: 32),
        doctorTypeLabel.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),
        doctorTypeLabel.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor)

        
//        doctorTypeLabel.leadingAnchor.constraint (equalTo: viewContainer.topAnchor, 32),
//        doctorTypeLabel.topAnchor.constraint(equalTo: viewContainer.leftAnchor, constant: 32),
//        viewContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//        viewContainer.bottomAnchor.constraint (equalTo: self.bottomAnchor)
   ].forEach { $0.isActive = true }
        super.updateConstraints()
        }
}
