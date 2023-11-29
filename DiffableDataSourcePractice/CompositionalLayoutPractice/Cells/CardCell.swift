//
//  CardCell.swift
//  DiffableDataSourcePractice
//
//  Created by Amais Sheikh on 29/11/2023.
//

import UIKit

class CardCell: BaseCollectionCell {
    
    private var itemsStackView: UIStackView = {
        let obj = UIStackView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.axis = .vertical
        obj.spacing = 4
        obj.backgroundColor = .orange
        return obj
    }()
    
    private var imageView: UIImageView = {
        let obj = UIImageView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        obj.layer.cornerRadius = 20
        obj.clipsToBounds = true
        return obj
    }()
    
    private var nameLabel: UILabel = {
        let obj = UILabel()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.backgroundColor = .brown
        obj.textColor = .systemBackground
        obj.font = UIFont.systemFont(ofSize: 12)
        obj.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        return obj
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        contentView.addSubview(itemsStackView)
        itemsStackView.addArrangedSubview(imageView)
        itemsStackView.addArrangedSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            itemsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            itemsStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setData(item: Item) {
        imageView.image = item.image
        nameLabel.text = item.title
    }
}
