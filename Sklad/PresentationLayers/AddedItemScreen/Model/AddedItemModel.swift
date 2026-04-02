//
//  AddedItemModel.swift
//  Sklad
//
//  Created by Евгений Фомичев on 12.01.2026.
//

import UIKit

enum AddedItemList {
    
    nonisolated enum Section: Hashable {
        case box
        case informationItem
    }
    
     struct AddedItemModel {
        let title: String
        let count: String
        let price: String
    }
}
