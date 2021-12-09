//
//  CollectionViewCell.swift
//  Ornament
//
//  Created by Anastasia on 22.11.2021.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    var myLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        myLabel.numberOfLines = 0
        backgroundColor = UIColor.systemGray5
        contentView.addSubview(myLabel)

        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor).isActive = true
        myLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
        myLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
        myLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor).isActive = true
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        layoutIfNeeded()
//        myLabel.preferredMaxLayoutWidth = myLabel.bounds.size.width
//        layoutAttributes.bounds.size.height = contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        return layoutAttributes
    }

}
