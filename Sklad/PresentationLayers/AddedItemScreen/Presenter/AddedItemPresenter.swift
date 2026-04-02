//
//  AddedItemPresenter.swift
//  Sklad
//
//  Created by Евгений Фомичев on 11.01.2026.
//

import Foundation

protocol AddedItemPresenter: AnyObject {
    func setupDataSource()
   // func saveItem(name: String, remainder: String, price: String)
    func saveTextWithItem(addedItem: AddedItemList.AddedItemModel)
}
