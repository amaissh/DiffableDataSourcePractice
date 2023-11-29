//
//  ActivityCell.swift
//  DiffableDataSourcePractice
//
//  Created by Amais Sheikh on 29/11/2023.
//

import UIKit

class ActivityCell: BaseCollectionCell {
    
    private var itemsStackView: UIStackView = {
        let obj = UIStackView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.axis = .horizontal
        obj.spacing = 0
        obj.backgroundColor = .orange
        return obj
    }()
    
    private var imageView: UIImageView = {
        let obj = UIImageView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        obj.clipsToBounds = true
        obj.layer.cornerRadius = 8
        return obj
    }()
    
    private var nameLabel: UILabel = {
        let obj = UILabel()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.backgroundColor = .brown
        obj.textAlignment = .center
        obj.textColor = .systemBackground
        obj.font = UIFont.systemFont(ofSize: 12)
        obj.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
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
            itemsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            imageView.widthAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func setData(item: Item) {
        imageView.image = item.image
        nameLabel.text = item.title
    }
}
