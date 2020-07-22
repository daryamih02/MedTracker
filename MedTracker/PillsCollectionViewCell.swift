//
//  PillsCollectionViewCell.swift
//  MedTracker
//
//  Created by Roman on 18.07.2020.
//  Copyright © 2020 MacBook Air. All rights reserved.
//

import UIKit
import SnapKit
class PillsCollectionViewCell: UICollectionViewCell {
    
    
    static let reuseId = "GalleryCollectionViewCell"
    

        
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        

        backgroundColor = .white
        


        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 40
        self.layer.shadowRadius = 9
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 5, height: 8)
        self.clipsToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

