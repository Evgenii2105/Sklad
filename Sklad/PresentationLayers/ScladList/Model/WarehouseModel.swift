//
//  WarehouseModel.swift
//  Sklad
//
//  Created by Евгений Фомичев on 09.01.2026.
//

import Foundation

enum WarehouseList {
    
    nonisolated enum Section: Hashable, CaseIterable {
        case main
    }
    
    nonisolated struct WarehouseModel: Hashable, Sendable {
        let name: String
        let itemsCount: String
        let id: Int
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        
        static func ==(lhs: WarehouseModel, rhs: WarehouseModel) -> Bool {
            lhs.id == rhs.id &&
            lhs.itemsCount == rhs.itemsCount &&
            lhs.name == rhs.name
        }
    }
    
    struct SectionData {
        let section: Section
        var data: [WarehouseModel]
    }
}
