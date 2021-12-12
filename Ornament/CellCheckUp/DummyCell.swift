//
//  DummyCell.swift
//  Ornament
//
//  Created by Anastasia on 09.12.2021.
//

import UIKit

class DummyCell: UICollectionViewCell {
    
    @IBOutlet var textLabel: UILabel!
    
    static let reuseIdentifier = "DummyCell"
    
    func configure(with text: String) {
        textLabel.text = "\(text)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderColor = UIColor.systemGray4.cgColor
        layer.borderWidth = 1.0
    }

}
