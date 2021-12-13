//
//  DoctorInfoView.swift
//  Ornament
//
//  Created by Alexandr Kuznetsov on 12.12.2021.
//

import UIKit

class DoctorInfoView: UIView {

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Записаться"
        label.textColor = .black
        label.font = label.font.withSize(20)
        label.textAlignment = .center
    
        return label
    }()

//    public var collectionViewController = DoctorTimeCollectionViewController()
    
    private var viewMorning =  UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        viewMorning = collectionViewController.view
        addSubviews()
        backgroundColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(nameLabel)
        addSubview(viewMorning)
        self.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    override func updateConstraints(){
        [
            nameLabel.leadingAnchor.constraint (equalTo: self.leadingAnchor, constant: 0),
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 200),
            
            viewMorning.leadingAnchor.constraint (equalTo: self.leadingAnchor, constant: 0),
            viewMorning.topAnchor.constraint(equalTo: self.topAnchor, constant: 400),
            viewMorning.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewMorning.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            

        ].forEach { $0.isActive = true }
        
         super.updateConstraints ()
    }
    

}
