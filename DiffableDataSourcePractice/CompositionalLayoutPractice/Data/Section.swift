//
//  Section.swift
//  DiffableDataSourcePractice
//
//  Created by Amais Sheikh on 29/11/2023.
//

import Foundation

enum Section {
    case people
    case cards
    case activities
    
//    var items: [Item] {
//        switch self {
//        case .people(let array), .cards(let array), .activities(let array):
//            return array
//        }
//    }
    
    var title: String {
        switch self {
        case .people:
            "People"
        case .cards:
            "Cards"
        case .activities:
            "Activities"
        }
    }
    
    static func section(atIndex index: Int) -> Section? {
        switch index {
        case 0:
            return .people
        case 1:
            return .cards
        case 2:
            return .activities
        default:
            return nil
        }
    }
}
