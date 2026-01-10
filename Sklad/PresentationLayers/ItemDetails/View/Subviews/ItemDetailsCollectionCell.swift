//
//  ItemDetailsCollectionCell.swift
//  Sklad
//
//  Created by Евгений Фомичев on 10.01.2026.
//

import UIKit

final class ItemDetailsCollectionCell: UICollectionViewCell {
    
    // MARK: Private Properties
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 2
        label.text = "кстела"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private let remainderLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        label.layer.cornerRadius = 8
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    private let counterContainer: UIView = {
        let counterContainer = UIView()
        return counterContainer
    }()
    
    private lazy var decreaseButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "minus")
        button.setImage(image, for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 12
        return button
    }()
    
    private let counterLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let additionButton: UIButton = {
       let button = UIButton()
        let image = UIImage(systemName: "plus")
        button.setImage(image, for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 12
        return button
    }()
    
    private let arrowImage: UIImageView = {
       let imageView = UIImageView()
        let image = UIImage(systemName: "chevron.compact.right")
        imageView.image = image
        imageView.tintColor = .lightGray
        return imageView
    }()
    
    // MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(item: ItemDetailsModel) {
        nameLabel.text = item.name
        switch item.count {
        case 0:
            remainderLabel.text = "Out Stock"
            remainderLabel.textColor = .red
            remainderLabel.backgroundColor = .red.withAlphaComponent(0.8)
        case 1...3:
            remainderLabel.text = "Low Stock"
            remainderLabel.textColor = .yellow
            remainderLabel.backgroundColor = .yellow.withAlphaComponent(0.8)
        case 4...Int.max:
            remainderLabel.text = "In Stock"
            remainderLabel.textColor = .green
            remainderLabel.backgroundColor = .green.withAlphaComponent(0.8)
        default:
            break
        }
        priceLabel.text = "Price \(item.price)"
        counterLabel.text = "\(item.count)"
    }
}

// MARK: - Private Extension

private extension ItemDetailsCollectionCell {
    
    func setupUI() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(remainderLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(counterContainer)
        counterContainer.addSubview(decreaseButton)
        counterContainer.addSubview(counterLabel)
        counterContainer.addSubview(additionButton)
        contentView.addSubview(arrowImage)
    }
    
    func setupConstraints() {
        nameLabel.addConstraints(constraints: [
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.widthAnchor.constraint(equalToConstant: 300),
            nameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
