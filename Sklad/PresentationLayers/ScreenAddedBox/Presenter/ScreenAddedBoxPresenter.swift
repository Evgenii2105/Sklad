//
//  ScreenAddedBoxPresenter.swift
//  Sklad
//
//  Created by Евгений Фомичев on 10.01.2026.
//

import Foundation

protocol ScreenAddedBoxPresenter: AnyObject {
    func addNewItem(item: WarehouseList.WarehouseModel)
}
