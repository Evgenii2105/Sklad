//
//  ScreenAddedBoxViewController.swift
//  Sklad
//
//  Created by Евгений Фомичев on 10.01.2026.
//

import UIKit

final class ScreenAddedBoxViewController: UIViewController {
    
    // MARK: Internal Properties
    
    var presenter: ScreenAddedBoxPresenter?
    
    // MARK: Private Properties
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Add Box"
        label.textColor = .white
        label.font = .systemFont(ofSize: 26, weight: .bold)
        return label
    }()
    
    private let titleTextField: UITextField = {
        let titleTextField = UITextField()
        titleTextField.attributedPlaceholder = NSAttributedString(
            string: "Added new box",
            attributes: [.foregroundColor: UIColor.lightGray]
        )
        
        titleTextField.textColor = .lightGray
        
        return titleTextField
    }()
    
    private let addBoxButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.tintColor = .lightGray
        button.layer.backgroundColor = Colors.contentViewBackgroundCollectionCell?.cgColor
        button.layer.cornerRadius = 22
        return button
    }()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
}

// MARK: - Extension ScreenAddedBoxView

extension ScreenAddedBoxViewController: ScreenAddedBoxView {
    
}

// MARK: - Private Extension ScreenAddedBoxViewController

private extension ScreenAddedBoxViewController {
    
    func setupUI() {
        view.backgroundColor = Colors.backgroundCollection
        view.addSubview(nameLabel)
        view.addSubview(titleTextField)
        view.addSubview(addBoxButton)
    }
    
    func setupConstraints() {
        nameLabel.addConstraints(constraints: [
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        titleTextField.addConstraints(constraints: [
            titleTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        addBoxButton.addConstraints(constraints: [
            addBoxButton.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 16),
            addBoxButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            addBoxButton.widthAnchor.constraint(equalToConstant: 150),
            addBoxButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
