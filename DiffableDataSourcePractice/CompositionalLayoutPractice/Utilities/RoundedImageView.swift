//
//  RoundedImageView.swift
//  DiffableDataSourcePractice
//
//  Created by Amais Sheikh on 29/11/2023.
//

import UIKit

class RoundedImageView: UIImageView {
    override var bounds: CGRect {
        didSet {
            self.layer.cornerRadius = bounds.height / 2
        }
    }
    
    init() {
        super.init(frame: .zero)
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.clipsToBounds = true
    }
}
