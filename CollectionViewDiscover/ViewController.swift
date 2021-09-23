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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
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
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = sections[indexPath.section]
        switch section {
        case .musicLibrary:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Self.cellIdentifier, for: indexPath) as! LibraryCell
            
            cell.setup(leftImageName: "default1", leftLabel: "Pop", rightImageName: "default2", rightLabel: "Rock")
            
            return cell
        default:
            return UICollectionViewCell()
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
            return CGSize(width: collectionView.frame.width - 32, height: 58)
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let section = sections[section]
        
        switch section {
        case .musicLibrary:
            return UIEdgeInsets(top: 24, left: 16, bottom: 12, right: 16)
        default:
            return .zero
        }
    }
}
