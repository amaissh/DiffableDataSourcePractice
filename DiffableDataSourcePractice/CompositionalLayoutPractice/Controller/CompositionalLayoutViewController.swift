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
//        let layout = CustomTestCollectionViewLayout.get()
        let layout = UICollectionViewFlowLayout()
        let obj = UICollectionView(frame: .zero, collectionViewLayout: layout)
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.backgroundColor = .cyan
        return obj
    }()
    
    private var data = MockData.get()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        
        view.backgroundColor = .lightGray
        
        practiceCollectionView.delegate = self
        practiceCollectionView.dataSource = self
        practiceCollectionView.register(PeopleCell.self, forCellWithReuseIdentifier: PeopleCell.identifier)
        practiceCollectionView.register(CardCell.self, forCellWithReuseIdentifier: CardCell.identifier)
        practiceCollectionView.register(ActivityCell.self, forCellWithReuseIdentifier: ActivityCell.identifier)
        
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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = data[indexPath.section]
        switch section {
        case .people:
            return getPeopleCell(collectionView, cellForItemAt: indexPath)
        case .cards:
            return getCardCell(collectionView, cellForItemAt: indexPath)
        case .activities:
            return getActivityCell(collectionView, cellForItemAt: indexPath)
        }
    }
    
    private func getPeopleCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PeopleCell.identifier, for: indexPath) as! PeopleCell
        cell.backgroundColor = .orange
        let item = data[indexPath.section].items[indexPath.row]
        cell.setData(item: item)
        return cell
    }
    
    private func getCardCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.identifier, for: indexPath) as! CardCell
        cell.backgroundColor = .orange
        let item = data[indexPath.section].items[indexPath.row]
        cell.setData(item: item)
        return cell
    }
    
    private func getActivityCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActivityCell.identifier, for: indexPath) as! ActivityCell
        cell.backgroundColor = .orange
        let item = data[indexPath.section].items[indexPath.row]
        cell.setData(item: item)
        return cell
    }
}
