//
//  CompositionalLayoutViewController.swift
//  DiffableDataSourcePractice
//
//  Created by Amais Sheikh on 28/11/2023.
//

import Foundation
import UIKit

class CompositionalLayoutViewController: UIViewController {
    
    private var practiceCollectionView: UICollectionView = {
        let layout = CustomTestCollectionViewLayout.get()
        let obj = UICollectionView(frame: .zero, collectionViewLayout: layout)
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.backgroundColor = .cyan
        return obj
    }()
    
    private var dataSource: UICollectionViewDiffableDataSource<TableSectionData, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        
        view.backgroundColor = .lightGray
        
        practiceCollectionView.register(PeopleCell.self, forCellWithReuseIdentifier: PeopleCell.identifier)
        practiceCollectionView.register(CardCell.self, forCellWithReuseIdentifier: CardCell.identifier)
        practiceCollectionView.register(ActivityCell.self, forCellWithReuseIdentifier: ActivityCell.identifier)
        practiceCollectionView.register(CollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionHeaderView")
        practiceCollectionView.delegate = self
        configureCollectionDataSource()
        
        view.addSubview(practiceCollectionView)
        
        NSLayoutConstraint.activate([
            practiceCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            practiceCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            practiceCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            practiceCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
    }
    
    private func configureCollectionDataSource() {
        setCollectionDataSource()
        applySnap()
    }
    
    private func setCollectionDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: practiceCollectionView) { collectionView, indexPath, itemIdentifier in
            let section = self.dataSource.snapshot().sectionIdentifiers[indexPath.section].sectionInfo
            switch section {
            case .people:
                return self.getPeopleCell(collectionView, cellForItemAt: indexPath, item: itemIdentifier)
            case .cards:
                return self.getCardCell(collectionView, cellForItemAt: indexPath, item: itemIdentifier)
            case .activities:
                return self.getActivityCell(collectionView, cellForItemAt: indexPath, item: itemIdentifier)
            }
        }
        
        dataSource.supplementaryViewProvider = { collectionView, elementKind, indexPath in
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: "CollectionHeaderView", for: indexPath) as! CollectionHeaderView
            header.titleLabel.text = ""
            guard elementKind == UICollectionView.elementKindSectionHeader else {
                return header
            }
            let title = self.dataSource.snapshot().sectionIdentifiers[indexPath.section].sectionInfo.title
            header.titleLabel.text = title
            return header
        }
    }
    
    private func applySnap() {
        let data = MockData.get()
        var snapshot = NSDiffableDataSourceSnapshot<TableSectionData, Item>()
        
        for section in data {
            snapshot.appendSections([section])
            snapshot.appendItems(section.items, toSection: section)
        }
        
        dataSource.apply(snapshot)
    }
}

extension CompositionalLayoutViewController: UICollectionViewDelegate {
    
    private func getPeopleCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath, item: Item) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PeopleCell.identifier, for: indexPath) as! PeopleCell
        cell.backgroundColor = .orange
        cell.setData(item: item)
        return cell
    }
    
    private func getCardCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath, item: Item) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.identifier, for: indexPath) as! CardCell
        cell.backgroundColor = .orange
        cell.setData(item: item)
        return cell
    }
    
    private func getActivityCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath, item: Item) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActivityCell.identifier, for: indexPath) as! ActivityCell
        cell.backgroundColor = .orange
        cell.setData(item: item)
        return cell
    }
}


// When data was directly used
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return data.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return data[section].items.count
//    }

//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let section = data[indexPath.section].sectionInfo
//        switch section {
//        case .people:
//            return getPeopleCell(collectionView, cellForItemAt: indexPath)
//        case .cards:
//            return getCardCell(collectionView, cellForItemAt: indexPath)
//        case .activities:
//            return getActivityCell(collectionView, cellForItemAt: indexPath)
//        }
//    }


//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionHeaderView", for: indexPath) as! CollectionHeaderView
//        header.titleLabel.text = ""
//        guard kind == UICollectionView.elementKindSectionHeader else {
//            return header
//        }
////        let title = data[indexPath.section].sectionInfo.title
//        let title = dataSource.snapshot().sectionIdentifiers[indexPath.section].title
//        return header
//    }
