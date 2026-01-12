//
//  WarehouceListCell.swift
//  Sklad
//
//  Created by Евгений Фомичев on 09.01.2026.
//

import UIKit

final class WarehouseListCell: UICollectionViewCell {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let itemsCountLabel: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 8
        label.textColor = .lightGray
        return label
    }()
    
    private let arrowImage: UIImageView = {
       let imageView = UIImageView()
        let image = UIImage(systemName: "chevron.compact.right")
        imageView.image = image
        imageView.tintColor = .lightGray
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(item: WarehouseList.WarehouseModel) {
        nameLabel.text = "\(item.name)"
        itemsCountLabel.text = "\(item.itemsCount) items"
    }
}

// MARK: - Private Extension WarehouseListCell

private extension WarehouseListCell {
    
    func setupUI() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(itemsCountLabel)
        contentView.addSubview(arrowImage)
        contentView.backgroundColor = Colors.contentViewBackgroundCollectionCell
        contentView.layer.cornerRadius = 22
    }
    
    func setupConstraints() {
        nameLabel.addConstraints(constraints: [
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
        
        itemsCountLabel.addConstraints(constraints: [
            itemsCountLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            itemsCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            itemsCountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
        
        arrowImage.addConstraints(constraints: [
            arrowImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            arrowImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),
            arrowImage.heightAnchor.constraint(equalToConstant: 22),
            arrowImage.widthAnchor.constraint(equalToConstant: 22)
        ])
    }
}
