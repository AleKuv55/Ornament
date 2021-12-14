//
//  DoctorInfoView.swift
//  Ornament
//
//  Created by Alexandr Kuznetsov on 12.12.2021.
//

import UIKit

class MainMenuView: UIView {

    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать,"
        label.textColor = .black
        label.font = label.font.withSize(40)
        label.textAlignment = .left
        label.font = label.font.bold
        return label
    }()
    private let subLabel: UILabel = {
        let label = UILabel()
        label.text = "Ешьте больше овощей"
        label.textColor = .lightGray
        label.font = label.font.withSize(20)
        label.textAlignment = .left
//        label.font = label.font.bold
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
        addSubview(subLabel)
        addSubview(tableView)
        self.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        UpdateConstraints()



    }
    func UpdateConstraints(){
        [
            headerLabel.leadingAnchor.constraint (equalTo: self.leadingAnchor, constant: 20),
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 148),
            
            subLabel.leadingAnchor.constraint (equalTo: self.leadingAnchor, constant: 20),
            subLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 4),
            subLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            subLabel.bottomAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 30),
            
            tableView.topAnchor.constraint (equalTo: subLabel.bottomAnchor, constant: 4),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint (equalTo: self.bottomAnchor)
            
            
        ].forEach { $0.isActive = true }
         super.updateConstraints ()
    }


}
extension UIFont {
    var bold: UIFont {
        return with(.traitBold)
    }

    var italic: UIFont {
        return with(.traitItalic)
    }

    var boldItalic: UIFont {
        return with([.traitBold, .traitItalic])
    }



    func with(_ traits: UIFontDescriptor.SymbolicTraits...) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(UIFontDescriptor.SymbolicTraits(traits).union(self.fontDescriptor.symbolicTraits)) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: 0)
    }

    func without(_ traits: UIFontDescriptor.SymbolicTraits...) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(self.fontDescriptor.symbolicTraits.subtracting(UIFontDescriptor.SymbolicTraits(traits))) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: 0)
    }
}
