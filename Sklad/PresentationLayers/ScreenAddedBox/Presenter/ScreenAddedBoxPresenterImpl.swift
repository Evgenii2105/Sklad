//
//  ScreenAddedBoxPresenterImpl.swift
//  Sklad
//
//  Created by Евгений Фомичев on 10.01.2026.
//

import UIKit

final class ScreenAddedBoxPresenterImpl: ScreenAddedBoxPresenter {
    
    weak var view: ScreenAddedBoxView?
    weak var delegate: GetNewBoxDelegate?
    
    func addNewItem(item: WarehouseList.WarehouseModel) {
        delegate?.getNewBox(item: item)
        view?.openWarehouseListScreen()
    }
}
