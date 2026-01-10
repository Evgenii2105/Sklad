//
//  WarehouseListPresenterImpl.swift
//  Sklad
//
//  Created by Евгений Фомичев on 09.01.2026.
//

import UIKit

final class WarehouseListPresenterImpl: WarehouseListPresenter {
    
    weak var view: WarehouseView?
    
    private let warehouseListModel: [WarehouseModel] = []
    
    func setupDataSource() {
        // идем в бд и возвращаем массив 
    }
    
    func openAddedNewBoxScreen() {
        view?.openScreenAddedBox()
    }
    
    func showDetails(item: WarehouseModel) {
        view?.showDetails(item: item)
    }
}
