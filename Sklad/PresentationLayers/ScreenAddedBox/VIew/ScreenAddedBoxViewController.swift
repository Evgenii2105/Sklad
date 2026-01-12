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
        titleTextField.layer.cornerRadius = 8
        titleTextField.backgroundColor = .lightGray.withAlphaComponent(0.1)
        
        return titleTextField
    }()
    
    private lazy var addNewBoxButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.tintColor = .lightGray
        button.layer.backgroundColor = Colors.contentViewBackgroundCollectionCell?.cgColor
        button.layer.cornerRadius = 22
        button.addTarget(
            self,
            action: #selector(addedNewBoxAction),
            for: .touchUpInside
        )
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
    
    func openWarehouseListScreen() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Private Extension ScreenAddedBoxViewController

private extension ScreenAddedBoxViewController {
    
    func setupUI() {
        view.backgroundColor = Colors.backgroundCollection
        view.addSubview(nameLabel)
        view.addSubview(titleTextField)
        view.addSubview(addNewBoxButton)
    }
    
    func setupConstraints() {
        nameLabel.addConstraints(constraints: [
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        titleTextField.addConstraints(constraints: [
            titleTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        addNewBoxButton.addConstraints(constraints: [
            addNewBoxButton.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 16),
            addNewBoxButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            addNewBoxButton.widthAnchor.constraint(equalToConstant: 150),
            addNewBoxButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc
    func addedNewBoxAction() {
        guard let text = titleTextField.text else { return }
        print("получили текс \(text)")
        presenter?.addNewItem(
            item: WarehouseList.WarehouseModel(
                name: "\(text)",
                itemsCount: "0",
                id: Int.random(in: 0..<Int.max)
            )
        )
    }
}
