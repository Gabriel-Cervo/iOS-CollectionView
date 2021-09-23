//
//  ListenAgainSongCell.swift
//  CollectionViewDiscover
//
//  Created by Joao Gabriel Dourado Cervo on 23/09/21.
//

import UIKit

class ListenAgainSongCell: UICollectionViewCell {
    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var songLabel: UILabel!
    
    static var labelFont: UIFont {
        let metrics = UIFontMetrics(forTextStyle: .largeTitle)
        let font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        return metrics.scaledFont(for: font)
    }

    func setup(song: Song) {
        self.songImage.image = song.image
        self.songLabel.text = song.name.uppercased()
        
        self.songLabel.font = Self.labelFont
    }
}
