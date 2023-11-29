//
//  CustomTestCollectionViewLayout.swift
//  DiffableDataSourcePractice
//
//  Created by Amais Sheikh on 29/11/2023.
//

import UIKit

class CustomTestCollectionViewLayout {
    
    static func get() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            guard let section = Section.section(atIndex: sectionIndex) else {
                return nil
            }
            
            switch section {
            case .people:
                return getPeopleSection()
            case .cards:
                return getCardsSection()
            case .activities:
                return getActivitiesSection()
            }
        }
        return layout
    }
    
    static private func getPeopleSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        item.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(84), heightDimension: .fractionalHeight(0.1)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 0, leading: 8, bottom: 8, trailing: 8)
        section.boundarySupplementaryItems = [NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(24)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)]
        return section
    }
    
    static private func getCardsSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        item.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.68)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.contentInsets = .init(top: 0, leading: 8, bottom: 8, trailing: 8)
        section.boundarySupplementaryItems = [NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(24)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)]
        return section
    }
    
    static private func getActivitiesSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        item.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(180), heightDimension: .fractionalHeight(0.12)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 0, leading: 8, bottom: 8, trailing: 8)
        section.boundarySupplementaryItems = [NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(24)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)]
        return section
    }
}

class SingleSectionCollectionLayout {
    static func get() -> UICollectionViewCompositionalLayout {
        
        //group
        let firstGroup = getFirstGroup()
        let secondGroup = getSecondGroup()
        let thirdGroup = getThirdGroup()
        let fourthGroup = getFourthGroup()
        
        let finalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                    heightDimension: .fractionalHeight(1.5))
        
        let finalGroup = NSCollectionLayoutGroup.vertical(layoutSize: finalGroupSize, subitems: [
            firstGroup,
            secondGroup,
            thirdGroup,
            fourthGroup
        ])
        
        //section
        let section = NSCollectionLayoutSection(group: finalGroup)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    static private func getFirstGroup() -> NSCollectionLayoutGroup {
        
        let firstSubFirstItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
        let firstSubFirstItem = NSCollectionLayoutItem(layoutSize: firstSubFirstItemSize)
        firstSubFirstItem.contentInsets = .init(top: 2, leading: 2, bottom: 2, trailing: 2)
        let firstSubFirstSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1))
        let firstSubFirstGroup = NSCollectionLayoutGroup.vertical(layoutSize: firstSubFirstSize, subitems: [firstSubFirstItem])
        firstSubFirstGroup.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        let firstSubSecondItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let firstSubSecondItem = NSCollectionLayoutItem(layoutSize: firstSubSecondItemSize)
        let firstSubSecondSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7), heightDimension: .fractionalHeight(1))
        let firstSubSecondGroup = NSCollectionLayoutGroup.vertical(layoutSize: firstSubSecondSize, subitems: [firstSubSecondItem])
        firstSubSecondGroup.contentInsets = .init(top: 10, leading: 0, bottom: 10, trailing: 8)
        
        let firstGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.3))
        let firstGroup = NSCollectionLayoutGroup.horizontal(layoutSize: firstGroupSize, subitems: [firstSubFirstGroup, firstSubSecondGroup])
        return firstGroup
    }
    
    static private func getSecondGroup() -> NSCollectionLayoutGroup {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let secondGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.15))
        let secondGroup = NSCollectionLayoutGroup.horizontal(layoutSize: secondGroupSize, subitems: [item])
        secondGroup.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
        return secondGroup
    }
    
    static private func getThirdGroup() -> NSCollectionLayoutGroup {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3333), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 8)
        let thirdGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.15))
        let thirdGroup = NSCollectionLayoutGroup.horizontal(layoutSize: thirdGroupSize, subitems: [item])
        thirdGroup.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
        return thirdGroup
    }
    
    static private func getFourthGroup() -> NSCollectionLayoutGroup {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: 8, bottom: 0, trailing: 8)
        
        let fourthGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.4))
        let fourthGroup = NSCollectionLayoutGroup.horizontal(layoutSize: fourthGroupSize, subitems: [item])
        fourthGroup.contentInsets = .init(top: 8, leading: 0, bottom: 8, trailing: 0)
        
        return fourthGroup
    }
}
