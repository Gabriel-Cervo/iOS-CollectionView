//
//  Discovery.swift
//  CollectionViewDiscover
//
//  Created by Joao Gabriel Dourado Cervo on 22/09/21.
//

import Foundation

enum Discovery {
    case musicLibrary
    case listenAgain
    case forYou
    case recentlyReleased
}

extension Discovery {
    init?(section: Int) {
        switch section {
        case 0: self = .musicLibrary
        case 1: self = .listenAgain
        case 2: self = .forYou
        case 3: self = .recentlyReleased
        default: self = .musicLibrary
        }
    }
}
