//
//  Section.swift
//  DiffableDataSourcePractice
//
//  Created by Amais Sheikh on 29/11/2023.
//

import Foundation

enum Section {
    case people([Item])
    case cards([Item])
    case activities([Item])
    
    var items: [Item] {
        switch self {
        case .people(let array), .cards(let array), .activities(let array):
            return array
        }
    }
    
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
}
