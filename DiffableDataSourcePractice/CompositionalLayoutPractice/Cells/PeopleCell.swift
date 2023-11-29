//
//  PeopleCell.swift
//  DiffableDataSourcePractice
//
//  Created by Amais Sheikh on 29/11/2023.
//

import UIKit

class PeopleCell: BaseCollectionCell {
    
    private var itemsStackView: UIStackView = {
        let obj = UIStackView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.axis = .vertical
        obj.spacing = 0
        obj.backgroundColor = .systemGreen
        return obj
    }()
    
    private var imageContainerView: UIView = {
        let obj = UIView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    private var imageView: RoundedImageView = {
        let obj = RoundedImageView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return obj
    }()
    
    private var nameLabel: UILabel = {
        let obj = UILabel()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.backgroundColor = .brown
        obj.textAlignment = .center
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
        itemsStackView.addArrangedSubview(imageContainerView)
        itemsStackView.addArrangedSubview(nameLabel)
        
        imageContainerView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            itemsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            itemsStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            nameLabel.heightAnchor.constraint(equalToConstant: 24),
            
            imageView.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            imageView.leadingAnchor.constraint(greaterThanOrEqualTo: imageContainerView.leadingAnchor),
            imageView.trailingAnchor.constraint(lessThanOrEqualTo: imageContainerView.trailingAnchor),
            imageView.topAnchor.constraint(greaterThanOrEqualTo: imageContainerView.topAnchor),
            imageView.bottomAnchor.constraint(lessThanOrEqualTo: imageContainerView.bottomAnchor),
        ])
    }
    
    func setData(item: Item) {
        imageView.image = item.image
        nameLabel.text = item.title
    }
}
