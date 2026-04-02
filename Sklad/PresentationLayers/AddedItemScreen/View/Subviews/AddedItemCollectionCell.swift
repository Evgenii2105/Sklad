//
//  AddedItemCollectionCell.swift
//  Sklad
//
//  Created by Евгений Фомичев on 12.01.2026.
//

import UIKit

protocol AddedItemCollectionDelegate: AnyObject {
    // func saveTextWithItem(name: String, remainder: String, price: String)
    func saveTextWithItem(addedItem: [AddedItemList.AddedItemModel])
}

final class AddedItemCollectionCell: UICollectionViewCell {
    
    // MARK: Private Properties
    
    weak var delegate: AddedItemCollectionDelegate?
    
    private let nameTitleTextField: UITextField = {
        let title = UITextField()
        title.attributedPlaceholder = NSAttributedString(
            string: "Name",
            attributes: [.foregroundColor: UIColor.red]
        )
        title.layer.cornerRadius = 8
        return title
    }()
    
    private let remainderTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "Остаток",
            attributes: [.foregroundColor: UIColor.red]
        )
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private let priceTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "Прайс",
            attributes: [.foregroundColor: UIColor.red]
        )
        textField.keyboardType = .numberPad
        return textField
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
    
    func configure() {
    }
}

// MARK: - Extension AddedItemCollectionCell UITextFieldDelegate

extension AddedItemCollectionCell: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let nameText = nameTitleTextField.text,
              let remainderText = remainderTextField.text,
              let priceText = priceTextField.text else { return }
        delegate?.saveTextWithItem(
            addedItem: [
                AddedItemList.AddedItemModel(
                    title: <#T##String#>, count: <#T##String#>, price: <#T##String#>
                )
            ]
        )
       // delegate?.saveTextWithItem(name: nameText, remainder: remainderText, price: priceText)
    }
}

// MARK: - Private extension AddedItemCollectionCell

private extension AddedItemCollectionCell {
    
    func setupUI() {
        contentView.layer.cornerRadius = 26
        contentView.backgroundColor = Colors.contentViewBackgroundCollectionCell
        contentView.addSubview(nameTitleTextField)
        contentView.addSubview(remainderTextField)
        contentView.addSubview(priceTextField)
        nameTitleTextField.delegate = self
        remainderTextField.delegate = self
        priceTextField.delegate = self
    }
    
    func setupConstraints() {
        nameTitleTextField.addConstraints(constraints: [
            nameTitleTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameTitleTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameTitleTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            nameTitleTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        remainderTextField.addConstraints(constraints: [
            remainderTextField.topAnchor.constraint(equalTo: nameTitleTextField.bottomAnchor, constant: 16),
            remainderTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            remainderTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            remainderTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        priceTextField.addConstraints(constraints: [
            priceTextField.topAnchor.constraint(equalTo: remainderTextField.bottomAnchor, constant: 16),
            priceTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            priceTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            priceTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            priceTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
