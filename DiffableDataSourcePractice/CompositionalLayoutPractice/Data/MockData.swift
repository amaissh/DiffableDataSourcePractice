//
//  MockData.swift
//  DiffableDataSourcePractice
//
//  Created by Amais Sheikh on 29/11/2023.
//

import Foundation

struct MockData {
    
    static func get() -> [Section] {
        var section = [Section]()
        section.append(getPeople())
        section.append(getCards())
        section.append(getActivities())
        return section
    }
    
    static private func getPeople() -> Section {
        
        var items = [Item]()
        for i in 0...6 {
            items.append(Item(title: "Person \(i)"))
        }
        
        let section = Section.people(items)
        return section
    }
    
    static private func getCards() -> Section {
        
        var items = [Item]()
        for i in 0...6 {
            items.append(Item(title: "Card Title \(i)"))
        }
        
        let section = Section.cards(items)
        return section
    }
    
    static private func getActivities() -> Section {
        
        var items = [Item]()
        for i in 0...6 {
            items.append(Item(title: "Activity \(i)"))
        }
        
        let section = Section.activities(items)
        return section
    }
}
