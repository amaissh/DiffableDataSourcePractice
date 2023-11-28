//
//  DiffablePracticeController.swift
//  DiffableDataSourcePractice
//
//  Created by Amais Sheikh on 28/11/2023.
//

import Foundation
import UIKit

struct TestableTableSection: Hashable {
    
}

struct TestableTableRow: Hashable {
    let id = UUID()
}

class DiffablePracticeController: UIViewController {
        
    private var testableTableView: UITableView = {
        let obj = UITableView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        obj.backgroundColor = .darkGray
        return obj
    }()
    
    private var tapButton: UIButton = {
        let obj = UIButton()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.backgroundColor = .black
        return obj
    }()
    private var allRowItems = [TestableTableRow]()
    private var tableViewDataSource: UITableViewDiffableDataSource<TestableTableSection, TestableTableRow>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        populate()
    }
    
    private func configure() {
        view.backgroundColor = .lightGray
        for _ in 0...4 {
            allRowItems.append(TestableTableRow())
        }
        
        testableTableView.delegate = self
        setDataSource()
        tapButton.addTarget(self, action: #selector(didTapTapButton), for: .touchUpInside)
        
        view.addSubview(testableTableView)
        view.addSubview(tapButton)
        
        NSLayoutConstraint.activate([
            testableTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            testableTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            testableTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            testableTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            
            tapButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            tapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tapButton.heightAnchor.constraint(equalToConstant: 40),
            tapButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setDataSource() {
        tableViewDataSource = UITableViewDiffableDataSource<TestableTableSection, TestableTableRow>(tableView: testableTableView) { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            var config = UIListContentConfiguration.valueCell()
            config.text = "This is cell \(indexPath.row)"
            cell.contentConfiguration = config
            cell.contentView.backgroundColor = .orange
            return cell
        }
    }
    
    private func populate() {
        var snapShot = NSDiffableDataSourceSnapshot<TestableTableSection, TestableTableRow>()
        snapShot.appendSections([TestableTableSection()])
        snapShot.appendItems(allRowItems)
        tableViewDataSource.apply(snapShot)
    }
    
    @objc private func didTapTapButton() {
//        if allRowItems.count > 8 {
            allRowItems.shuffle()
//        } else {
//            allRowItems.append(TestableTableRow())
//        }
        
        populate()
    }
}


extension DiffablePracticeController: UITableViewDelegate {
    
}
