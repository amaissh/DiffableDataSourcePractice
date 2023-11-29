//
//  Item.swift
//  DiffableDataSourcePractice
//
//  Created by Amais Sheikh on 29/11/2023.
//

import UIKit

struct Item {
    var image: UIImage
    var title: String
    
    init(image: UIImage = UIImage(named: "hands")!, title: String = "Title") {
        self.image = image
        self.title = title
    }
}
