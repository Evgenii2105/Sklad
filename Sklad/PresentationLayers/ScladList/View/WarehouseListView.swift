//
//  WarehouseView.swift
//  Sklad
//
//  Created by Евгений Фомичев on 09.01.2026.
//

import Foundation

protocol WarehouseView: AnyObject {
    func openScreenAddedBox()
    func getListWarehouse(data provider: [WarehouseList.SectionData])
}
