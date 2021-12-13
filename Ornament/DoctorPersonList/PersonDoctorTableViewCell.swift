//
//  PersonDoctorTableViewCell.swift
//  Ornament
//
//  Created by Alexandr Kuznetsov on 22.11.2021.
//

import UIKit

struct PersonDoctorDataModel {
    let name: String
    let imagePath: String
    let rating:String
    let isBusy:Bool
}

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
        view.backgroundColor = .clear
        return view
    }()

    private let doctorNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Путьков Дмитрий"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    private let doctorBusyLabel: UILabel = {
        let label = UILabel()
        label.text = "Свободен"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .green
        return label
    }()
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "4.99"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .black
        return label
    }()
    
    private let photoDoctor: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named:"Image")
        return imageView
    }()
    
    private func addSubviews () {
        contentView.addSubview(viewContainer)
        contentView.addSubview(doctorNameLabel)
        contentView.addSubview(photoDoctor)
        contentView.addSubview(doctorBusyLabel)
        contentView.addSubview(ratingLabel)
        self.contentView.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    func update(data:String) {
        self.doctorNameLabel.text = data
    }
    
    func updateCellData (dataModel: PersonDoctorDataModel) {
        self.doctorNameLabel.text = dataModel.name
        self.photoDoctor.image = UIImage.init(named: dataModel.imagePath)
        self.doctorBusyLabel.text = dataModel.isBusy ? "Занят" : "Свободен"
        self.doctorBusyLabel.textColor = dataModel.isBusy ? .red : .green
        self.ratingLabel.text = dataModel.rating
    }
    
    
    func setupConstraints() {
    [
        viewContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
        viewContainer.topAnchor.constraint (equalTo: self.contentView.topAnchor),
        viewContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        viewContainer.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),

        photoDoctor.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 32),
        photoDoctor.topAnchor.constraint (equalTo: viewContainer.topAnchor, constant: 32),
        photoDoctor.widthAnchor.constraint(equalToConstant: 64),
        photoDoctor.heightAnchor.constraint(equalToConstant: 64),
        photoDoctor.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor, constant: -32),
        
        doctorNameLabel.leadingAnchor.constraint(equalTo: photoDoctor.trailingAnchor, constant: 16),
        doctorNameLabel.topAnchor.constraint (equalTo: photoDoctor.topAnchor, constant: 8),
        doctorNameLabel.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),
        
        doctorBusyLabel.leadingAnchor.constraint(equalTo: doctorNameLabel.leadingAnchor),
        doctorBusyLabel.topAnchor.constraint (equalTo: doctorNameLabel.bottomAnchor, constant: 4),
        doctorBusyLabel.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),
        
//        ratingLabel.leadingAnchor.constraint(equalTo: photoDoctor.leadingAnchor, constant: 44),
        ratingLabel.topAnchor.constraint (equalTo: photoDoctor.topAnchor),
        ratingLabel.trailingAnchor.constraint(equalTo: photoDoctor.trailingAnchor, constant: -2),




   ].forEach { $0.isActive = true }
        super.updateConstraints()
        }

}
