//
//  AddedItemPresenterImpl.swift
//  Sklad
//
//  Created by Евгений Фомичев on 11.01.2026.
//

import UIKit

final class AddedItemPresenterImpl: AddedItemPresenter {

    weak var view: AddedItemView?
    private let itemStorage: ItemStorage
    
    private var addedItemModel: [AddedItemList.AddedItemModel] = [
        AddedItemList.AddedItemModel(title: "", count: "1", price: "200"),
    ]
    
    init(itemStorage: ItemStorage) {
        self.itemStorage = itemStorage
    }
    
    func setupDataSource() {
        view?.getItem(item: addedItemModel)
    }
    
//    func saveItem(name: String, remainder: String, price: String) {
//        itemStorage.saveItem(name: name, remainder: remainder, price: price)
//    }
    
    func saveTextWithItem(addedItem: AddedItemList.AddedItemModel) {
        
    }
}
