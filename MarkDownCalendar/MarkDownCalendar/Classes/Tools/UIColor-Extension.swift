//
//  UIColor-Extension.swift
//  MarkDownCalendar
//
//  Created by Oscar on 2019/8/8.
//  Copyright © 2019 Oscar. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(R: CGFloat, G:CGFloat, B:CGFloat){
        self.init(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: 1.0)
    }
}
