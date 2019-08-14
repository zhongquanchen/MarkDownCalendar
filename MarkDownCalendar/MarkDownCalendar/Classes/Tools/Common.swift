//
//  Common.swift
//  MarkDownCalendar
//
//  Created by Oscar on 2019/8/8.
//  Copyright © 2019 Oscar. All rights reserved.
//

import Foundation
import UIKit

let kStatusBarH : CGFloat = UIApplication.shared.isStatusBarHidden ? CGFloat(0) : UIApplication.shared.statusBarFrame.height
let kNavigationBarH : CGFloat = 44
let kTitleViewH : CGFloat = 40
let kTabBarH : CGFloat = 49

let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height

let kCalendarViewH : CGFloat = kScreenH - 2 * kTitleViewH - kTabBarH - kNavigationBarH - kStatusBarH
