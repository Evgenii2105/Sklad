//
//  WarehouseListRouter.swift
//  Sklad
//
//  Created by Евгений Фомичев on 11.01.2026.
//

import UIKit

protocol WarehouseListRouter: AnyObject {
    func showDetails(item: WarehouseList.WarehouseModel)
}

final class WarehouseListRouterImpl: WarehouseListRouter {
    
    weak var viewController: UIViewController?
    weak var delegate: GetNewBoxDelegate?
    
    func showDetails(item: WarehouseList.WarehouseModel) {
        let view = ItemDetailsViewController()
        let presenter = ItemDetailsPresenterImpl()
        let router = ItemDetailsRouterImpl()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        router.viewController = view
        
        viewController?.navigationController?.pushViewController(view, animated: true)
    }
}
