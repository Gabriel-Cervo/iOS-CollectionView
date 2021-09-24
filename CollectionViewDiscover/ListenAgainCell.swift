//
//  ListenAgainCell.swift
//  CollectionViewDiscover
//
//  Created by Joao Gabriel Dourado Cervo on 23/09/21.
//

import UIKit


struct Song {
    var imageName: String
    var name: String
    var artist: String? = nil
    
    var image: UIImage? {
        UIImage(named: self.imageName)
    }
}

struct MockSongs {
    static let instance = [Song(imageName: "default1", name: "Older"), Song(imageName: "default2", name: "Rock"), Song(imageName: "default1", name: "Older"), Song(imageName: "default2", name: "Rock")]
}

class ListenAgainCell: UICollectionViewCell {
    @IBOutlet var listenAgainCollection: UICollectionView!
    @IBOutlet weak var label: UILabel!
    
    static let cellIdentifier = "listenSongCell"
    
    static var listenAgainLabel: UIFont {
        let metrics = UIFontMetrics(forTextStyle: .title1)
        let font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        return metrics.scaledFont(for: font)
    }
    
    var songs: [Song] = MockSongs.instance
    
    override func awakeFromNib() {
        super.awakeFromNib()
        listenAgainCollection.dataSource = self
        listenAgainCollection.delegate = self
        label.font = Self.listenAgainLabel
    }
    
    func relayout() {
        self.listenAgainCollection.collectionViewLayout.invalidateLayout()
    }
    
    static func calculateSize(text: String, screenWidth: CGFloat) -> CGSize {
        let width: CGFloat = UIApplication.shared.preferredContentSizeCategory.isAccessibilityCategory ? (screenWidth - 32 - 8) * 0.66 : (screenWidth - 32 - 8) * 0.4
        
        let height = (text as NSString).boundingRect(with: CGSize(width: width, height: .infinity), options: .usesLineFragmentOrigin, attributes: [.font: ListenAgainSongCell.labelFont], context: nil).height + width + 4
        
        return CGSize(width: width, height: height)
    }
    
    static func calculateFullHeight(text: String, screenWidth: CGFloat) -> CGFloat {
        let size = calculateSize(text: text, screenWidth: screenWidth)
                
        let height = ("Listen Again" as NSString).boundingRect(with: CGSize(width: screenWidth, height: .infinity), options: .usesLineFragmentOrigin, attributes: [.font: Self.listenAgainLabel], context: nil).height
        
        return size.height + height + 8
    }
}

//MARK: - Collection View DataSource

// Ugly code, refactor if have time
extension ListenAgainCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let song = songs[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Self.cellIdentifier, for: indexPath) as! ListenAgainSongCell
    
        cell.setup(song: song)
        
        return cell
    }
}

//MARK: - Collection Delegate

extension ListenAgainCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("click")
    }
}

//MARK: - Collection Flow Layout

extension ListenAgainCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let song = songs[indexPath.row]
        
        var size = Self.calculateSize(text: song.name, screenWidth: collectionView.frame.width)
        
        size.height -= 1
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}
