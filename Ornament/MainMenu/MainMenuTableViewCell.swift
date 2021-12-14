//
//  TableViewCell.swift
//  Ornament
//
//  Created by Alexandr Kuznetsov on 13.12.2021.
//

import UIKit

class MainMenuTableViewCell: UITableViewCell {

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

    private let menuNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Записаться к врачу"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    
    private let subNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Лучшие врачи из СНГ"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()


    
    private let menuImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named:"Image")
        return imageView
    }()
    
    private func addSubviews () {
        contentView.addSubview(viewContainer)
        contentView.addSubview(menuNameLabel)
        contentView.addSubview(menuImage)
        contentView.addSubview(subNameLabel)
        self.contentView.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    func update(data:String) {
        self.menuNameLabel.text = data
    }
    
    func updateCellData (dataModel: MenuNameDataModel) {
        self.menuNameLabel.text = dataModel.name
        self.subNameLabel.text = dataModel.subName
        self.menuImage.image = UIImage.init(named: dataModel.menuImage)
    }
    
    
    func setupConstraints() {
    [
        viewContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
        viewContainer.topAnchor.constraint (equalTo: self.contentView.topAnchor),
        viewContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        viewContainer.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),

        menuImage.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 16),
        menuImage.topAnchor.constraint (equalTo: viewContainer.topAnchor, constant: 16),
        menuImage.widthAnchor.constraint(equalToConstant: 48),
        menuImage.heightAnchor.constraint(equalToConstant: 48),
        menuImage.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor, constant: -16),
        
        menuNameLabel.leadingAnchor.constraint(equalTo: menuImage.trailingAnchor, constant: 8),
        menuNameLabel.topAnchor.constraint (equalTo: menuImage.topAnchor, constant: 4),
        menuNameLabel.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),
 

        subNameLabel.leadingAnchor.constraint(equalTo: menuNameLabel.leadingAnchor),
        subNameLabel.topAnchor.constraint (equalTo: menuNameLabel.bottomAnchor, constant: 4),
        subNameLabel.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),

   ].forEach { $0.isActive = true }
        super.updateConstraints()
        }

}
