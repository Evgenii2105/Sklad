//
//  ItemStorage.swift
//  Sklad
//
//  Created by Евгений Фомичев on 10.01.2026.
//

import Foundation

protocol ItemStorage: AnyObject {
    
}

final class ItemStorageImpl: ItemStorage {
    
    private let userDefaults = UserDefaults.standard
    private let key = "item"
}
