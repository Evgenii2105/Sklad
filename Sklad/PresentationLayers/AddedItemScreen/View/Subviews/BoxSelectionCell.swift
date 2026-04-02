//
//  BoxSelectionCell.swift
//  Sklad
//
//  Created by Евгений Фомичев on 12.01.2026.
//

import UIKit

final class BoxSelectionCell: UICollectionViewCell {
    
    // MARK: Internal Properties
    
    // MARK: Private Properties 
    
    // MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        
    }
}

// MARK: - Private extension BoxSelectionCell

private extension BoxSelectionCell {
    
    func setupUI() {
        
    }
    
    func setupConstraints() {
        
    }
}
