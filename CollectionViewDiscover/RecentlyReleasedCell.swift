//
//  RecentlyReleasedCell.swift
//  CollectionViewDiscover
//
//  Created by Joao Gabriel Dourado Cervo on 24/09/21.
//

import UIKit

class RecentlyReleasedCell: UICollectionViewCell {
    @IBOutlet weak var imageView: CircularImage!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var musicBox: MusicBox!
    
    func setup(song: Song) {
        self.imageView.image = song.image
        self.label.text = song.artist ?? "Unknown"
        musicBox.setup(song: song)
    }
}
