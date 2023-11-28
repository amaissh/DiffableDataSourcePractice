//
//  CompositionalLayoutViewController.swift
//  DiffableDataSourcePractice
//
//  Created by Amais Sheikh on 28/11/2023.
//

import Foundation
import UIKit

class CustomTestCollectionViewLayout {
    static func get() -> UICollectionViewCompositionalLayout {
        
        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        //group
        let firstGroup = getFirstGroup()
        let secondGroup = getSecondGroup()
        let thirdGroup = getThirdGroup()
        let fourthGroup = getFourthGroup()
        
        let finalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalHeight(2))
        
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
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1))
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
        
        let fourthGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.3))
        let fourthGroup = NSCollectionLayoutGroup.horizontal(layoutSize: fourthGroupSize, subitems: [item])
        fourthGroup.contentInsets = .init(top: 8, leading: 0, bottom: 8, trailing: 0)
        
        return fourthGroup
    }
}


class CompositionalLayoutViewController: UIViewController {
    
    private var practiceCollectionView: UICollectionView = {
        let layout = CustomTestCollectionViewLayout.get()
        let obj = UICollectionView(frame: .zero, collectionViewLayout: layout)
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.backgroundColor = .cyan
        return obj
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        
        view.backgroundColor = .lightGray
        
        practiceCollectionView.delegate = self
        practiceCollectionView.dataSource = self
        practiceCollectionView.register(SampleCollectionCell.self, forCellWithReuseIdentifier: "cell")
        
        view.addSubview(practiceCollectionView)
        
        NSLayoutConstraint.activate([
            practiceCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            practiceCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            practiceCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            practiceCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
    }
}

extension CompositionalLayoutViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SampleCollectionCell
        cell.backgroundColor = .orange
        cell.imageView.image = UIImage(named: "hands")
        return cell
    }
}
