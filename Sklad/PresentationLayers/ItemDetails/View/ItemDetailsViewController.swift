//
//  ItemDetailsViewController.swift
//  Sklad
//
//  Created by Евгений Фомичев on 10.01.2026.
//

import UIKit

final class ItemDetailsViewController: UIViewController {
    
    // MARK: Internal Properties
    
    var presenter: ItemDetailsPresenter?
    var model: [ItemDetailsModel] = [
        ItemDetailsModel(
            name: "stella", remainder: "",
            price: "220",
            count: 5
        ),
        ItemDetailsModel(
            name: "stella", remainder: "",
            price: "220",
            count: 10
        ),
        ItemDetailsModel(
            name: "stella", remainder: "",
            price: "220",
            count: 0
        ),
        ItemDetailsModel(
            name: "stella", remainder: "",
            price: "220",
            count: 2
        ),
        ItemDetailsModel(
            name: "stella", remainder: "",
            price: "220",
            count: 2
        ),
    ]
    
    // MARK: Private Properties
    
    private let searchController: UISearchController
    
    private lazy var itemDetailsCollection: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: 370, height: 200)
        
        let collection = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collection.register(
            ItemDetailsCollectionCell.self,
            forCellWithReuseIdentifier: ItemDetailsCollectionCell.reuseIdentifier
        )
        collection.backgroundColor = Colors.backgroundCollection
        collection.frame = view.frame
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let resultController = SearchResultsViewController()
        self.searchController = UISearchController(searchResultsController: resultController)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSearchController()
        // setupConstraints()
    }
}

// MARK: - Extension UISearchResultsUpdating

extension ItemDetailsViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        print("поиск")
    }
}

// MARK: - UICollectionViewDelegate && UICollectionViewDataSource

extension ItemDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ItemDetailsCollectionCell.reuseIdentifier,
            for: indexPath
        ) as? ItemDetailsCollectionCell else {
            return UICollectionViewCell()
        }
        
        let item = model[indexPath.item]
        cell.configure(item: item)
        return cell
    }
}

// MARK: - Extension ItemDetailsView

extension ItemDetailsViewController: ItemDetailsView {
    
}

// MARK: - Private Extension ItemDetailsViewController

private extension ItemDetailsViewController {
    
    func setupUI() {
        view.addSubview(itemDetailsCollection)
    }
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.tintColor = .lightGray
        
        definesPresentationContext = true
        searchController.modalTransitionStyle = .coverVertical
        searchController.modalPresentationStyle = .fullScreen
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
}
