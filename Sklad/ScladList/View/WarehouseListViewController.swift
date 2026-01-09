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
        WarehouseModel(name: "1"),
        WarehouseModel(name: "2"),
        WarehouseModel(name: "3"),
        WarehouseModel(name: "4"),
        WarehouseModel(name: "5"),
        WarehouseModel(name: "6"),
        WarehouseModel(name: "7")
    ]
    
    // MARK: Private Properties
    
    private let searchController: UISearchController
    
    private lazy var warehouseCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
    
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: 370, height: 150)
        let collection = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collection.register(
            WarehouseListCell.self,
            forCellWithReuseIdentifier: WarehouseListCell.reuseIdentifier
        )
        collection.backgroundColor = .red
        collection.dataSource = self
        collection.delegate = self
        return collection
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
        setupUI()
        setupConstraints()
        setupSearchController()
       // presenter?.setupDataSource()
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension WarehouseListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
    }
    
    func setupUI() {
        view.addSubview(warehouseCollection)
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
}
