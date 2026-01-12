//
//  SkladListBuilder.swift
//  Sklad
//
//  Created by Евгений Фомичев on 11.01.2026.
//

import UIKit

final class SkladListBuilder {
    
    static func build() -> UIViewController {
        let view = WarehouseListViewController()
        let presenter = WarehouseListPresenterImpl()
        let router = WarehouseListRouterImpl()
        
        view.presenter = presenter
        presenter.view = view
        router.viewController = view
        presenter.router = router
        
        return view
    }
}
