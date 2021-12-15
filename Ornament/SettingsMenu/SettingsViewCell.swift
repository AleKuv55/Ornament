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
    
    private let settingName: UILabel = {
        let label = UILabel()
        label.text = "О проекте"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    
    private func addSubviews () {
        contentView.addSubview(viewContainer)
        contentView.addSubview(settingName)
        self.contentView.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    //// нужно ли прописывать это дважды?
    func update(data: String) {
        self.settingName.text = data
    }
    
    func updateCellData (dataModel: SettingsDataModel) {
        self.settingName.text = dataModel.setting
    }
    
    func setupConstraints() {
    [
        viewContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
        viewContainer.topAnchor.constraint (equalTo: self.contentView.topAnchor),
        viewContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        viewContainer.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        
        settingName.leadingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: 8),
        settingName.topAnchor.constraint (equalTo: viewContainer.topAnchor, constant: 4),
        settingName.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor)

   ].forEach { $0.isActive = true }
        super.updateConstraints()
        }

}
