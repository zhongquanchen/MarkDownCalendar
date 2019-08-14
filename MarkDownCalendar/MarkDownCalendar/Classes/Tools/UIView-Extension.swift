//
//  UIView-Extension.swift
//  MarkDownCalendar
//
//  Created by Oscar on 2019/8/14.
//  Copyright © 2019 Oscar. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
//MARK:-用于显示 only topright and left 的 round corner
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
