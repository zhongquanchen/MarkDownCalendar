//
//  CollectionHeaderView.swift
//  MarkDownCalendar
//
//  Created by Oscar on 2019/8/14.
//  Copyright © 2019 Oscar. All rights reserved.
//

import UIKit

private let kCornerRadius : CGFloat = 7

class CollectionHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var middleWhitespace: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        middleWhitespace.roundCorners([.topLeft, .topRight], radius: 10)
//        print(middleWhitespace.frame.width)
//
        middleWhitespace.clipsToBounds = true
        middleWhitespace.layer.cornerRadius = kCornerRadius
        middleWhitespace.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner] // Top right corner, Top left corner respectively
    }
    
}
