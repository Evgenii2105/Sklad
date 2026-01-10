//
//  WarehouseListPresenter.swift
//  Sklad
//
//  Created by Евгений Фомичев on 09.01.2026.
//

protocol WarehouseListPresenter: AnyObject {
    func setupDataSource()
    func openAddedNewBoxScreen()
    func showDetails(item: WarehouseModel)
}
