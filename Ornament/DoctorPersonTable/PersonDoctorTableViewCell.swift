//
//  PersonDoctorTableViewCell.swift
//  Ornament
//
//  Created by Alexandr Kuznetsov on 22.11.2021.
//

import UIKit

class PersonDoctorTableViewCell: UITableViewCell {

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
        view.backgroundColor = .gray
        return view
    }()

    private let doctorTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Путьков Дмитрий"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    
    private func addSubviews () {
        contentView.addSubview(doctorTypeLabel)
        self.contentView.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    func update(data:CellDataModel) {
//        self.doctorTypeLabel.text = data.title
    }
    
    func setupConstraints() {
    [
        doctorTypeLabel.topAnchor.constraint (equalTo: self.topAnchor, constant: 24),
        doctorTypeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        doctorTypeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        doctorTypeLabel.bottomAnchor.constraint (equalTo: self.bottomAnchor)
        
//        viewContainer.topAnchor.constraint (equalTo: self.topAnchor),
//        viewContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//        viewContainer.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 335),
//        viewContainer.heightAnchor.constraint(equalTo: self.heightAnchor, constant: 141),
//        doctorTypeLabel.leadingAnchor.constraint (equalTo: viewContainer.topAnchor, 32),
//        doctorTypeLabel.topAnchor.constraint(equalTo: viewContainer.leftAnchor, constant: 32),
//        viewContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//        viewContainer.bottomAnchor.constraint (equalTo: self.bottomAnchor)
   ].forEach { $0.isActive = true }
        super.updateConstraints()
        }

}
