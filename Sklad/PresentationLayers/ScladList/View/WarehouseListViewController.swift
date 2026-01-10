//
//  WarehouseListViewController.swift
//  Sklad
//
//  Created by Евгений Фомичев on 09.01.2026.
//

import UIKit

class WarehouseListViewController: UIViewController {
    
    // MARK: Internal Properties
    
    var presenter: WarehouseListPresenter?
    
    var model: [WarehouseModel] = [
        WarehouseModel(name: "Водка", itemsCount: "16"),
        WarehouseModel(name: "Пива", itemsCount: "16"),
        WarehouseModel(name: "Шапманское", itemsCount: "16"),
        WarehouseModel(name: "Вино", itemsCount: "16"),
        WarehouseModel(name: "Ром", itemsCount: "16"),
        WarehouseModel(name: "6", itemsCount: "16"),
        WarehouseModel(name: "7", itemsCount: "16")
    ]
    
    // MARK: Private Properties
    
    private let searchController: UISearchController
    
    private lazy var warehouseCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
    
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: 370, height: 100)
        let collection = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collection.register(
            WarehouseListCell.self,
            forCellWithReuseIdentifier: WarehouseListCell.reuseIdentifier
        )
        collection.backgroundColor = Colors.backgroundCollection
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    private lazy var addedItemButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "folder.fill.badge.plus")
        button.setImage(image, for: .normal)
        button.tintColor = .lightGray
        button.backgroundColor = Colors.addedNewBoxButtonBackground
        button.layer.cornerRadius = 32
        button.addTarget(
            self,
            action: #selector(addedNewItem),
            for: .touchUpInside
        )
        return button
    }()
    
    // MARK: Lifecycle
    
    init() {
        let resultController = SearchResultsViewController()
        self.searchController = UISearchController(searchResultsController: resultController)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = . black
        setupNavigationBar() 
        setupUI()
        setupConstraints()
        setupSearchController()
       // presenter?.setupDataSource()
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension WarehouseListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        model.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: WarehouseListCell.reuseIdentifier,
            for: indexPath
        ) as? WarehouseListCell else {
            return UICollectionViewCell()
        }
        let item = model[indexPath.item]
        cell.configure(item: item)
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        let item = model[indexPath.item]
        presenter?.showDetails(item: item)
    }
}

// MARK: - Extension WarehouseView

extension WarehouseListViewController: WarehouseView {
    
    func openScreenAddedBox() {
        let view = ScreenAddedBoxViewController()
        let presenter = ScreenAddedBoxPresenterImpl()
        view.presenter = presenter
        presenter.view = view
        
        navigationController?.pushViewController(view, animated: true)
    }
    
    func showDetails(item: WarehouseModel) {
        let view = ItemDetailsViewController()
        let presenter = ItemDetailsPresenterImpl()
        
        view.presenter = presenter
        presenter.view = view
        
        navigationController?.pushViewController(view, animated: true)
    }
}

// MARK: - Extension UISearchResultsUpdating

extension WarehouseListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        print("поиск")
    }
}

// MARK: - SkladViewController

private extension WarehouseListViewController {
    
    func setupConstraints() {
        warehouseCollection.addConstraints(constraints: [
            warehouseCollection.topAnchor.constraint(equalTo: view.topAnchor),
            warehouseCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            warehouseCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            warehouseCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        addedItemButton.addConstraints(constraints: [
            addedItemButton.bottomAnchor.constraint(equalTo: warehouseCollection.bottomAnchor, constant: -90),
            addedItemButton.trailingAnchor.constraint(equalTo: warehouseCollection.trailingAnchor, constant: -16),
            addedItemButton.widthAnchor.constraint(equalToConstant: 60),
            addedItemButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func setupNavigationBar() {
        let title = UILabel()
        title.text = "My warehouse"
        title.font = .monospacedDigitSystemFont(ofSize: 26, weight: .bold)
        title.textColor = .lightGray
        
        navigationItem.titleView = title
    }
    
    func setupUI() {
        view.addSubview(warehouseCollection)
        view.addSubview(addedItemButton)
    }
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.tintColor = .lightGray
        
        definesPresentationContext = true
        searchController.modalPresentationStyle = .fullScreen
        searchController.modalTransitionStyle = .coverVertical
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    @objc
    func addedNewItem() {
        presenter?.openAddedNewBoxScreen()
    }
}
