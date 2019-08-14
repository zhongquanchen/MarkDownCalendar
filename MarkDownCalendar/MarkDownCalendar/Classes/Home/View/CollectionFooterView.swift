//
//  CollectionFooterView.swift
//  MarkDownCalendar
//
//  Created by Oscar on 2019/8/14.
//  Copyright © 2019 Oscar. All rights reserved.
//

import UIKit

private let kCornerRadius : CGFloat = 7

class CollectionFooterView: UICollectionReusableView {

    @IBOutlet weak var cornerWhiteSpace: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cornerWhiteSpace.clipsToBounds = true
        cornerWhiteSpace.layer.cornerRadius = 7
        cornerWhiteSpace.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]// bottom right corner, bottom left corner respectively
    }
    
}
