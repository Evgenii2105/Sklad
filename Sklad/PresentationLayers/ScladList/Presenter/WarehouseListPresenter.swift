//
//  WarehouseListPresenter.swift
//  Sklad
//
//  Created by Евгений Фомичев on 09.01.2026.
//

import Foundation

protocol WarehouseListPresenter: AnyObject {
    func setupDataSource()
    func openAddedNewBoxScreen()
    func showDetails(item: WarehouseList.WarehouseModel)
    func addedNewItem(item: WarehouseList.WarehouseModel)
    func deleteItem(item: IndexPath)
}
