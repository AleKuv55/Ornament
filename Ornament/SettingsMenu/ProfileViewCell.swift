//
//  ProfileViewCell.swift
//  Ornament
//
//  Created by Anastasia on 15.12.2021.
//

import UIKit

class ProfileViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let viewContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private let userName: UILabel = {
        let label = UILabel()
        label.text = "Дмитрий"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    
    private let userSurname: UILabel = {
        let label = UILabel()
        label.text = "Путьков"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named:"Image")
        return imageView
    }()
    
    private func addSubviews () {
        contentView.addSubview(viewContainer)
        contentView.addSubview(userName)
        contentView.addSubview(userSurname)
        contentView.addSubview(profileImage)
        self.contentView.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func updateCellData (dataModel: ProfileDataModel) {
        self.userName.text = dataModel.name
        self.userSurname.text = dataModel.surname
        self.profileImage.image = UIImage.init(named: dataModel.profilePhoto)
    }
    
    func setupConstraints() {
    [
        viewContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
        viewContainer.topAnchor.constraint (equalTo: self.contentView.topAnchor),
        viewContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        viewContainer.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),

        profileImage.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 16),
        profileImage.topAnchor.constraint (equalTo: viewContainer.topAnchor, constant: 16),
        profileImage.widthAnchor.constraint(equalToConstant: 48),
        profileImage.heightAnchor.constraint(equalToConstant: 48),
        profileImage.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor, constant: -16),
        
        userName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 8),
        userName.topAnchor.constraint (equalTo: profileImage.topAnchor, constant: 4),
        userName.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),
 

        userSurname.leadingAnchor.constraint(equalTo: userName.leadingAnchor),
        userSurname.topAnchor.constraint (equalTo: userName.bottomAnchor, constant: 4),
        userSurname.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),

   ].forEach { $0.isActive = true }
        super.updateConstraints()
        }

}
