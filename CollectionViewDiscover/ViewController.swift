//
//  ViewController.swift
//  CollectionViewDiscover
//
//  Created by Joao Gabriel Dourado Cervo on 22/09/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    
    let sections: [Discovery] = [.musicLibrary, .listenAgain, .forYou, .recentlyReleased]
    
    static let cellIdentifier = "libraryCell"
    static let forYouCellIdentifier = "forYou"
    static let recentlyReleasedIdentifier = "recentlyReleased"
    
    let songs = MockSongs.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(alertNotification(_:)), name: UIContentSizeCategory.didChangeNotification, object: nil)
    }
    
    @objc func alertNotification(_ notification: Notification) {
        self.collectionView.collectionViewLayout.invalidateLayout()
        collectionView.visibleCells.forEach { cell in
            if let cell = cell as? ListenAgainCell {
                cell.relayout()
            }
        }
    }
}

//MARK: - Collection View DataSource

// Ugly code, refactor if have time
extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let section = sections[section]
        switch section {
        case .musicLibrary:
            return 2
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = sections[indexPath.section]
        switch section {
        case .musicLibrary:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Self.cellIdentifier, for: indexPath) as! LibraryCell
            
            cell.setup(leftImageName: "default1", leftLabel: "Pop", rightImageName: "default2", rightLabel: "Rock")
            
            return cell
        case .listenAgain:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListenAgain", for: indexPath) as! ListenAgainCell

            return cell
        case .forYou:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Self.forYouCellIdentifier, for: indexPath) as! ForYouCell
            cell.firstMusicBox.setup(song: songs[0])
            cell.secondMusicBox.setup(song: songs[1])
            
            return cell
        case .recentlyReleased:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Self.recentlyReleasedIdentifier, for: indexPath) as! RecentlyReleasedCell
            
            cell.setup(song: songs[0])
        
            return cell
        }
    }
}

//MARK: - Collection Delegate

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("click")
    }
}

//MARK: - Collection Flow Layout

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section = sections[indexPath.section]
    
        switch section {
        case .musicLibrary:
            return CGSize(width: collectionView.frame.width - 32, height: 50)
        case .listenAgain:
            let songHeight = songs.map { song in
                ListenAgainCell.calculateFullHeight(text: song.name, screenWidth: collectionView.frame.width)
            }.max() ?? 0
            
            return CGSize(width: collectionView.frame.width, height: songHeight + 1)
        case .forYou:
            return CGSize(width: collectionView.frame.width - 32, height: 232)
        case .recentlyReleased:
            return CGSize(width: collectionView.frame.width - 32, height: 140)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let section = sections[section]
        
        switch section {
        case .musicLibrary:
            return UIEdgeInsets(top: 24, left: 16, bottom: 12, right: 16)
        case .forYou:
            return UIEdgeInsets(top: 24, left: 16, bottom: 36, right: 16)
        default:
            return .zero
        }
    }
}
