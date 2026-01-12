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
    
    typealias DataSource = UICollectionViewDiffableDataSource<WarehouseList.Section, WarehouseList.WarehouseModel>
    typealias SnapShot = NSDiffableDataSourceSnapshot<WarehouseList.Section, WarehouseList.WarehouseModel>
    
    // MARK: Private Properties
    
    private let searchController: UISearchController
    
    private lazy var dataSource: DataSource = {
        let data = DataSource(
            collectionView: warehouseCollection
        ) { collectionView, indexPath, itemIdentifier in
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: WarehouseListCell.reuseIdentifier,
                for: indexPath
            ) as? WarehouseListCell else {
                return UICollectionViewCell()
            }
            cell.configure(item: itemIdentifier)
            return cell
        }
        return data
    }()
    
    private lazy var warehouseCollection: UICollectionView = {
        let collection = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewLayout()
        )
        collection.register(
            WarehouseListCell.self,
            forCellWithReuseIdentifier: WarehouseListCell.reuseIdentifier
        )
        
        collection.delegate = self
        return collection
    }()
    
    private lazy var addedItemButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "folder.fill.badge.plus")
        button.setImage(image, for: .normal)
        button.tintColor = .lightGray
        button.backgroundColor = Colors.addedNewBoxButtonBackground
        button.layer.cornerRadius = 30
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
        setupNavigationBar()
        setupUI()
        setupConstraints()
        setupSearchController()
        presenter?.setupDataSource()
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension WarehouseListViewController: UICollectionViewDelegate {
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        guard let item = dataSource.itemIdentifier(for: indexPath) else { return }
        presenter?.showDetails(item: item)
    }
    
   
}

// MARK: - Extension WarehouseView

extension WarehouseListViewController: WarehouseView {
    
    func getListWarehouse(data provider: [WarehouseList.SectionData]) {
        let newLayout = makeLayout(with: provider)
        warehouseCollection.setCollectionViewLayout(newLayout, animated: true)
        applySnapShot(section: provider)
    }

    func openScreenAddedBox() {
        let view = ScreenAddedBoxViewController()
        let presenter = ScreenAddedBoxPresenterImpl()
        view.presenter = presenter
        presenter.view = view
        presenter.delegate = self
        
        navigationController?.pushViewController(view, animated: true)
    }
}

// MARK: - Extension UISearchResultsUpdating

extension WarehouseListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        print("поиск")
    }
}

// MARK: - GetNewBox

extension WarehouseListViewController: GetNewBoxDelegate {
    
    func getNewBox(item: WarehouseList.WarehouseModel) {
        presenter?.addedNewItem(item: item)
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
            addedItemButton.bottomAnchor.constraint(equalTo: warehouseCollection.bottomAnchor, constant: -110),
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
    
    func applySnapShot(section: [WarehouseList.SectionData]) {
        var snapShot = SnapShot()
        for sectionData in section {
            if !sectionData.data.isEmpty {
                 snapShot.appendSections([sectionData.section])
                snapShot.appendItems(sectionData.data, toSection: sectionData.section)
            }
        }
        dataSource.apply(snapShot, animatingDifferences: true)
    }
    
    func setupUI() {
        view.backgroundColor = Colors.backgroundCollection
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
    
    func makeLayout(
        with provider: [WarehouseList.SectionData]
    ) -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment in
            var config = UICollectionLayoutListConfiguration(appearance: .plain)
            config.backgroundColor = Colors.backgroundCollection
            
            config.trailingSwipeActionsConfigurationProvider = { [weak self] indexPath in
                guard let self else { return nil }
                
                let deleteAction = UIContextualAction(
                    style: .destructive,
                    title: ""
                ) { action, sourceView, actionPerformed in
                    self.presenter?.deleteItem(item: indexPath)
                        actionPerformed(true)
                    }
                deleteAction.backgroundColor = .red
                deleteAction.image = UIImage(systemName: "trash")
                
                return UISwipeActionsConfiguration(actions: [deleteAction])
            }
            let section = NSCollectionLayoutSection.list(
                using: config,
                layoutEnvironment: environment
            )
            section.interGroupSpacing = 8
            section.contentInsets = NSDirectionalEdgeInsets(
                top: 8,
                leading: 8,
                bottom: 15,
                trailing: 8
            )
            return section
        }
        return layout
    }
}
