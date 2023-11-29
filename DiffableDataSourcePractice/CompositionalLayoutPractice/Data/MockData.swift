//
//  MockData.swift
//  DiffableDataSourcePractice
//
//  Created by Amais Sheikh on 29/11/2023.
//

import Foundation

struct MockData {
    
    static func get() -> [TableSectionData] {
        var section = [TableSectionData]()
        section.append(getPeople())
        section.append(getCards())
        section.append(getActivities())
        return section
    }
    
    static private func getPeople() -> TableSectionData {
        
        var items = [Item]()
        for i in 0...6 {
            items.append(Item(title: "Person \(i)"))
        }
        
        let section = Section.people
        return TableSectionData(sectionInfo: section, items: items)
    }
    
    static private func getCards() -> TableSectionData {
        
        var items = [Item]()
        for i in 0...6 {
            items.append(Item(title: "Card Title \(i)"))
        }
        
        let section = Section.cards
        return TableSectionData(sectionInfo: section, items: items)
    }
    
    static private func getActivities() -> TableSectionData {
        
        var items = [Item]()
        for i in 0...6 {
            items.append(Item(title: "Activity \(i)"))
        }
        
        let section = Section.activities
        return TableSectionData(sectionInfo: section, items: items)
    }
}
