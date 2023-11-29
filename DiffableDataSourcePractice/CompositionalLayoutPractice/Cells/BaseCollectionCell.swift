//
//  BaseCollectionCell.swift
//  DiffableDataSourcePractice
//
//  Created by Amais Sheikh on 29/11/2023.
//

import UIKit

class BaseCollectionCell: UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
