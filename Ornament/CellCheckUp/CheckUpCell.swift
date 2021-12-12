//
//  CheckUpCell.swift
//  Ornament
//
//  Created by Anastasia on 09.12.2021.
//

import UIKit

class CheckUpCell: UICollectionViewCell {
    
    @IBOutlet var textLabel: UILabel!
    
    static let reuseIdentifier = "CheckUpCell"
    
    func configure(with text: String) {
        textLabel.numberOfLines = 0
        textLabel.text = "\(text)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderColor = UIColor.systemGray4.cgColor
        layer.borderWidth = 1.0
    }

    
}
