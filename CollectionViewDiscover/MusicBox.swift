//
//  MusicBox.swift
//  CollectionViewDiscover
//
//  Created by Joao Gabriel Dourado Cervo on 23/09/21.
//

import UIKit

class MusicBox: UIView {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var musicLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    let nibName = "MusicBox"
    var contentView: UIView?
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        
        contentView = view
    }

    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func setup(song: Song) {
        let borderColor = UIColor.lightGray
        
        contentView?.layer.cornerRadius = 4
        contentView?.layer.borderWidth = 1
        contentView?.layer.borderColor = borderColor.cgColor
        contentView?.layer.masksToBounds = true
        
        self.imageView.image = song.image
        self.musicLabel.text = song.name
        self.artistLabel.text = song.artist
    }
}
