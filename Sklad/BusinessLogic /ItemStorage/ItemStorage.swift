//
//  ItemStorage.swift
//  Sklad
//
//  Created by Евгений Фомичев on 10.01.2026.
//

import Foundation

protocol ItemStorage: AnyObject {
    // func saveItem(name: String, remainder: String, price: String)
    func saveItem(item: AddedItemList.AddedItemModel)
    func getItem() -> [AddedItemList.AddedItemModel]
}

final class ItemStorageImpl: ItemStorage {
    
    private let userDefaults = UserDefaults.standard
    private let key = "item"
    
    func saveItem(item: AddedItemList.AddedItemModel) {
        let itemsData = item.map {  item in
            
        }
    }
    
//    func saveItem(name: String, remainder: String, price: String) {
//        let item = AddedItemList.AddedItemModel(title: <#T##String#>, count: <#T##String#>, price: <#T##String#>)
//        userDefaults.set(item, forKey: key)
//        userDefaults.synchronize()
//        print("сохранил объект \(item)")
//    }
    
    func getItem() -> [AddedItemList.AddedItemModel] {
        guard let item = userDefaults.object(forKey: key) else { return [] }
        return item as? [AddedItemList.AddedItemModel] ?? []
    }
}
