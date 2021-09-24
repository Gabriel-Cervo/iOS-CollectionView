//
//  CircularImage.swift
//  CollectionViewDiscover
//
//  Created by Joao Gabriel Dourado Cervo on 24/09/21.
//

import UIKit

class CircularImage: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        clipsToBounds = true
        layer.cornerRadius = min(frame.width, frame.height) / 2
    }
}
