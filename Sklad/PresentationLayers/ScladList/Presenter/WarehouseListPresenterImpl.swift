//
//  WarehouseListPresenterImpl.swift
//  Sklad
//
//  Created by Евгений Фомичев on 09.01.2026.
//

import UIKit

protocol GetNewBoxDelegate: AnyObject {
    func getNewBox(item: WarehouseList.WarehouseModel)
}

final class WarehouseListPresenterImpl: WarehouseListPresenter {
    
    weak var view: WarehouseView?
    var router: WarehouseListRouter?

    private var warehouseListModel: [WarehouseList.SectionData] = [
        WarehouseList.SectionData(
            section: .main, data: [
                WarehouseList.WarehouseModel(name: "Пиво", itemsCount: "12", id: 1),
                WarehouseList.WarehouseModel(name: "Водка", itemsCount: "10", id: 2),
                WarehouseList.WarehouseModel(name: "Ром", itemsCount: "12", id: 3),
                WarehouseList.WarehouseModel(name: "Шампанское", itemsCount: "4", id: 4),
                WarehouseList.WarehouseModel(name: "Пиво", itemsCount: "12", id: 5),
                WarehouseList.WarehouseModel(name: "Пиво", itemsCount: "12", id: 6),
                WarehouseList.WarehouseModel(name: "Пиво", itemsCount: "12", id: 7),
                WarehouseList.WarehouseModel(name: "Пиво", itemsCount: "12", id: 8),
                WarehouseList.WarehouseModel(name: "Пиво", itemsCount: "12", id: 9),
            ]
        )
    ]

    func setupDataSource() {
        view?.getListWarehouse(data: warehouseListModel)
    }
    
    func openAddedNewBoxScreen() {
        view?.openScreenAddedBox()
    }
    
    func showDetails(item: WarehouseList.WarehouseModel) {
        router?.showDetails(item: item)
    }
    
    func addedNewItem(item: WarehouseList.WarehouseModel) {
        if warehouseListModel.isEmpty {
            warehouseListModel = [
                WarehouseList.SectionData(section: .main, data: [item])
            ]
        } else {
            let targetIndex = 0 
            let section = warehouseListModel[targetIndex]
            let newData = section.data + [item]
            let newSection = WarehouseList.SectionData(section: section.section, data: newData)
            warehouseListModel[targetIndex] = newSection
        }
        view?.getListWarehouse(data: warehouseListModel)
    }
    
    func deleteItem(item: IndexPath) {
        guard warehouseListModel.indices.contains(item.section) else { return }
        let section = warehouseListModel[item.section]
        guard section.data.indices.contains(item.row) else { return }
        
        var newData = section.data
        newData.remove(at: item.row)
        let newSection = WarehouseList.SectionData(section: section.section, data: newData)
        warehouseListModel[item.section] = newSection
        
        view?.getListWarehouse(data: warehouseListModel)
    }
}
