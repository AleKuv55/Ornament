//
//  CollectionViewCell.swift
//  Ornament
//
//  Created by Anastasia on 22.11.2021.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
//    @IBOutlet weak var checkUpLabel: UILabel!
    
    let checkUpLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        checkUpLabel.numberOfLines = 0
        backgroundColor = UIColor.systemGray5
        contentView.addSubview(checkUpLabel)

        checkUpLabel.translatesAutoresizingMaskIntoConstraints = false
        checkUpLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor).isActive = true
        checkUpLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
        checkUpLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
        checkUpLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor).isActive = true
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        layoutIfNeeded()
//        checkUpLabel.preferredMaxLayoutWidth = checkUpLabel.bounds.size.width
//        layoutAttributes.bounds.size.height = contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        return layoutAttributes
    }

}
