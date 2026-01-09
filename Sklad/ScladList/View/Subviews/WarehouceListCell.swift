//
//  WarehouceListCell.swift
//  Sklad
//
//  Created by Евгений Фомичев on 09.01.2026.
//

import UIKit

final class WarehouseListCell: UICollectionViewCell {
    
    private let label: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.text = "123"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(item: WarehouseModel) {
        label.text = item.name
    }
}

// MARK: - Private Extension WarehouseListCell

private extension WarehouseListCell {
    
    func setupUI() {
        contentView.addSubview(label)
        contentView.backgroundColor = .blue
        contentView.layer.cornerRadius = 22
    }
    
    func setupConstraints() {
        label.addConstraints(constraints: [
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
