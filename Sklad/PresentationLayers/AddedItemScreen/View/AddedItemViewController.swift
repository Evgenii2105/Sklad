//
//  AddedItemViewController.swift
//  Sklad
//
//  Created by Евгений Фомичев on 11.01.2026.
//

import UIKit

protocol AddedItemView: AnyObject {
    
}

final class AddedItemViewController: UIViewController {
    
    // MARK: Internal Properties
    
    var presenter: AddedItemPresenter?
    
    // MARK: Provate Properties
    
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Extension AddedItemView

extension AddedItemViewController: AddedItemView {
    
}

// MARK: - Private Extension AddedItemViewController

private extension AddedItemViewController {
    
}
