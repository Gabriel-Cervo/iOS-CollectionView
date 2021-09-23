//
//  LibraryCell.swift
//  CollectionViewDiscover
//
//  Created by Joao Gabriel Dourado Cervo on 22/09/21.
//

import UIKit

class LibraryCell: UICollectionViewCell {
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var leftView: UIView!
    
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var rightview: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let borderColor = UIColor(named: "light-gray")
        
        leftView.layer.cornerRadius = 4
        leftView.layer.borderWidth = 1
        leftView.layer.borderColor = borderColor?.cgColor
        leftView.layer.masksToBounds = true
        
        rightview.layer.cornerRadius = 4
        rightview.layer.borderWidth = 1
        rightview.layer.borderColor = borderColor?.cgColor
        rightview.layer.masksToBounds = true
  
    }
    
    func setup(leftImageName: String, leftLabel: String, rightImageName: String, rightLabel: String) {
        self.leftLabel.text = leftLabel
        self.leftImageView.image = UIImage(named: leftImageName)
    
        self.rightLabel.text = rightLabel
        self.rightImageView.image = UIImage(named: rightImageName)
    }
}
