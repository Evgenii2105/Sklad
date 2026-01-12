//
//  ItemDetailsPresenter.swift
//  Sklad
//
//  Created by Евгений Фомичев on 10.01.2026.
//

import Foundation

protocol ItemDetailsPresenter: AnyObject {
    func decreaseCount()
    func additionCount()
    func addedNewItemAction()
}
