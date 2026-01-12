//
//  ItemDetailsCollectionCell.swift
//  Sklad
//
//  Created by Евгений Фомичев on 10.01.2026.
//

import UIKit

protocol ChangeCounterDelegate: AnyObject {
    func decreaseCount()
    func additionCount()
}

final class ItemDetailsCollectionCell: UICollectionViewCell {
    
    // MARK: Internal Properties
    
    weak var delegate: ChangeCounterDelegate?
    
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
        label.font = .systemFont(ofSize: 12, weight: .light)
         label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.textAlignment = .center
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    private let counterContainer: UIView = {
        let counterContainer = UIView()
        counterContainer.layer.cornerRadius = 22
        return counterContainer
    }()
    
    private lazy var decreaseButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "minus")
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.backgroundColor = .gray
        button.layer.cornerRadius = 12
        button.addTarget(
            self,
            action: #selector(decreaseCount),
            for: .touchUpInside
        )
        return button
    }()
    
    private let counterLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var additionButton: UIButton = {
       let button = UIButton()
        let image = UIImage(systemName: "plus")
        button.setImage(image, for: .normal)
        button.backgroundColor = .gray
        button.tintColor = .white
        button.layer.cornerRadius = 12
        button.addTarget(
            self,
            action: #selector(additionCount),
            for: .touchUpInside
        )
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
        changeBackgroundRemainderLabel(value: item.count)
        priceLabel.text = "Price \(item.price)"
        counterLabel.text = "\(item.count)"
    }
}

// MARK: - Private Extension

private extension ItemDetailsCollectionCell {
    
    func setupUI() {
        contentView.backgroundColor = Colors.contentViewBackgroundCollectionCell
        contentView.layer.cornerRadius = 22
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
        
        remainderLabel.addConstraints(constraints: [
            remainderLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            remainderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            remainderLabel.widthAnchor.constraint(equalToConstant: 70),
            remainderLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
        
        priceLabel.addConstraints(constraints: [
            priceLabel.topAnchor.constraint(equalTo: remainderLabel.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -22),
            priceLabel.widthAnchor.constraint(equalToConstant: 120),
            
        ])
        
        counterContainer.addConstraints(constraints: [
            counterContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            counterContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            counterContainer.widthAnchor.constraint(equalToConstant: 150),
            counterContainer.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        decreaseButton.addConstraints(constraints: [
            decreaseButton.centerYAnchor.constraint(equalTo: counterContainer.centerYAnchor),
            decreaseButton.leadingAnchor.constraint(equalTo: counterContainer.leadingAnchor, constant: 8),
            decreaseButton.widthAnchor.constraint(equalToConstant: 30),
            decreaseButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        counterLabel.addConstraints(constraints: [
            counterLabel.centerYAnchor.constraint(equalTo: counterContainer.centerYAnchor),
            counterLabel.centerXAnchor.constraint(equalTo: counterContainer.centerXAnchor)
        ])
        
        additionButton.addConstraints(constraints: [
            additionButton.leadingAnchor.constraint(equalTo: counterLabel.trailingAnchor, constant: 16),
            additionButton.centerYAnchor.constraint(equalTo: counterContainer.centerYAnchor),
            additionButton.trailingAnchor.constraint(equalTo: counterContainer.trailingAnchor, constant: -8),
            additionButton.widthAnchor.constraint(equalToConstant: 30),
            additionButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @objc
    func decreaseCount() {
        let current = Int(counterLabel.text ?? "0") ?? 0
        let newValue = max(0, current - 1)
       changeBackgroundRemainderLabel(value: newValue)
        counterLabel.text = "\(newValue)"
        delegate?.decreaseCount()
    }
    
    @objc
    func additionCount() {
        let current = Int(counterLabel.text ?? "") ?? 0
        let newValue = current + 1
        changeBackgroundRemainderLabel(value: newValue)
        counterLabel.text = "\(newValue)"
        delegate?.additionCount()
    }
    
    func changeBackgroundRemainderLabel(value: Int) {
        switch value {
        case 0:
            remainderLabel.text = "Out Stock"
            remainderLabel.textColor = .red
            remainderLabel.backgroundColor = .red.withAlphaComponent(0.1)
        case 1...3:
            remainderLabel.text = "Low Stock"
            remainderLabel.textColor = .yellow
            remainderLabel.backgroundColor = .yellow.withAlphaComponent(0.1)
        case 4...Int.max:
            remainderLabel.text = "In Stock"
            remainderLabel.textColor = .green
            remainderLabel.backgroundColor = .green.withAlphaComponent(0.1)
        default:
            break
        }
    }
}
