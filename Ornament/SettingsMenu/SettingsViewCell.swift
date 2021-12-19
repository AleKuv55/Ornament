//
//  SettingsViewCell.swift
//  Ornament
//
//  Created by Anastasia on 15.12.2021.
//

import UIKit

class SettingsViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
        selectionStyle = .default
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let viewContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let settingName: UILabel = {
        let label = UILabel()
        label.text = "О проекте"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    private let settingImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "Image")
        return imageView
    }()
    
    private func addSubviews() {
        contentView.addSubview(viewContainer)
        contentView.addSubview(settingName)
        contentView.addSubview(settingImage)
        self.contentView.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func updCellData(dataModel: SettingsDataModel) {
        self.settingName.text = dataModel.setting
        self.settingImage.image = UIImage.init(named: dataModel.settingImage)
    }
    
    func setupConstraints() {
    [
        viewContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
        viewContainer.topAnchor.constraint (equalTo: self.contentView.topAnchor),
        viewContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        viewContainer.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        
        settingImage.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 16),
        settingImage.topAnchor.constraint (equalTo: viewContainer.topAnchor, constant: 16),
        settingImage.widthAnchor.constraint(equalToConstant: 48),
        settingImage.heightAnchor.constraint(equalToConstant: 48),
        settingImage.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor, constant: -16),
        
        settingName.leadingAnchor.constraint(equalTo: settingImage.trailingAnchor, constant: 15),
        settingName.topAnchor.constraint (equalTo: viewContainer.topAnchor),
        settingName.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),
        settingName.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor)
        
   ].forEach { $0.isActive = true }
        super.updateConstraints()
    }
}
