//
//  ItemDetailsRouter.swift
//  Sklad
//
//  Created by Евгений Фомичев on 12.01.2026.
//

import UIKit

protocol ItemDetailsRouter: AnyObject {
    func addedNewItemScreen()
}

final class ItemDetailsRouterImpl: ItemDetailsRouter {
    
    weak var viewController: UIViewController?
    
    func addedNewItemScreen() {
        let view = AddedItemViewController()
        let presenter = AddedItemPresenterImpl()
        
        
        view.presenter = presenter
        presenter.view = view
        
        viewController?.navigationController?.pushViewController(view, animated: true)
    }
}
