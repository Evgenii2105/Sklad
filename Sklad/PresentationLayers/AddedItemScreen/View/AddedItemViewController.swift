//
//  AddedItemViewController.swift
//  Sklad
//
//  Created by Евгений Фомичев on 11.01.2026.
//

import UIKit

protocol AddedItemView: AnyObject {
    func getItem(item: [AddedItemList.AddedItemModel])
}

final class AddedItemViewController: UIViewController {
    
    // MARK: Internal Properties
    
    var presenter: AddedItemPresenter?
    
    // MARK: Provate Properties
    
    private var model: [AddedItemList.AddedItemModel] = [
        AddedItemList.AddedItemModel(title: "Введите название", count: "1", price: "220")
    ]
    
    private lazy var saveItemButton: UIBarButtonItem = {
      
//        return UIBarButtonItem(
//            title: "Сохранить",
//            primaryAction: UIAction(
//                title: "Save",
//                handler: { [weak self] _ in
//                    self?.saveItem()
//                }
//            )
//        )
    }()
    
    private lazy var addedItemCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 400, height: 200)
        layout.minimumLineSpacing = 8
       let collection = UICollectionView(
        frame: .zero,
        collectionViewLayout: layout
       )
//        collection.register(
//            BoxSelectionCell.self,
//            forCellWithReuseIdentifier: BoxSelectionCell.reuseIdentifier
//        )
        
        collection.register(
            AddedItemCollectionCell.self,
            forCellWithReuseIdentifier: AddedItemCollectionCell.reuseIdentifier
        )
        collection.backgroundColor = Colors.backgroundCollection
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        presenter?.setupDataSource()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addedItemCollection.frame = view.bounds
    }
}

// MARK: - Extension UICollectionViewDelegate && UICollectionViewDataSource

extension AddedItemViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AddedItemCollectionCell.reuseIdentifier,
            for: indexPath
        ) as? AddedItemCollectionCell else {
            return UICollectionViewCell()
        }
        cell.configure()
        cell.delegate = self
        return cell
    }
}

// MARK: - Extension AddedItemView

extension AddedItemViewController: AddedItemView {
    
    func getItem(item: [AddedItemList.AddedItemModel]) {
        
    }
}

// MARK: - Extension AddedItemCollectionDelegate

extension AddedItemViewController: AddedItemCollectionDelegate {
    
    func saveTextWithItem(addedItem: AddedItemList.AddedItemModel) {
        presenter?.saveTextWithItem(addedItem: addedItem)
    }
    
    
//    func saveTextWithItem(name: String, remainder: String, price: String) {
//        print("Попали на вью из ячейки по делегату")
//        presenter?.saveItem(name: name, remainder: remainder, price: price)
//    }
}

// MARK: - Private Extension AddedItemViewController

private extension AddedItemViewController {
    
    func setupUI() {
       
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            systemItem: .done,
            primaryAction: UIAction(
                handler: <#T##UIActionHandler#>
            )
        )
        view.backgroundColor = Colors.backgroundCollection
        view.addSubview(addedItemCollection)
       
    }
    
    func setupConstraints() {
        
    }
    
    func setupListLayout() {
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
    }
    
    func saveItem() {

    }
}
