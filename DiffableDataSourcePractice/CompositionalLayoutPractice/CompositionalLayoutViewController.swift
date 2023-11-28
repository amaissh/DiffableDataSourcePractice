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
        return UICollectionViewCompositionalLayout(section: NSCollectionLayoutSection(group: NSCollectionLayoutGroup(layoutSize: .init(widthDimension: .absolute(300), heightDimension: .absolute(300)))))
    }
}


class CompositionalLayoutViewController: UIViewController {
    
    private var practiceCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let obj = UICollectionView(frame: .zero, collectionViewLayout: layout)
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.backgroundColor = .darkGray
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
        practiceCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        
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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .orange
        return cell
    }
}
