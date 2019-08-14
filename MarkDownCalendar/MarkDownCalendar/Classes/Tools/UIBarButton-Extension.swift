//
//  UIBarButton-Extension.swift
//  MarkDownCalendar
//
//  Created by Oscar on 2019/8/8.
//  Copyright © 2019 Oscar. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem{
    
    convenience init(imageName: String, highImageName : String = "", size: CGSize) {
        let btn = UIButton()
        //设置点击item
        btn.setImage(UIImage(named: imageName), for: .normal)
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        //设置btn尺寸
        if size == CGSize.zero{
            btn.sizeToFit()
        } else{
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        self.init(customView: btn)
    }
}
