//
//  ItemDetailsPresenterImpl.swift
//  Sklad
//
//  Created by Евгений Фомичев on 10.01.2026.
//

import UIKit

final class ItemDetailsPresenterImpl: ItemDetailsPresenter {
    
    weak var view: ItemDetailsView?
    var router: ItemDetailsRouter?

    private var itemDetailsModel: [ItemDetailsModel] = []
    
    func additionCount() {
        print("добавили +1")
       // itemDetailsModel.
    }
    
    func decreaseCount() {
        print("Убавили -1чк")
    }
    
    func addedNewItemAction() {
        router?.addedNewItemScreen()
    }
}
