//
//  HomeViewController.swift
//  MarkDownCalendar
//
//  Created by Oscar on 2019/8/8.
//  Copyright © 2019 Oscar. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK:-懒加载title属性
    private lazy var daytitleView : DayTitleView = {[weak self] in
        let dayTitles = ["S","M","T","W","T","F","S"]
        let titleframe = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: kTitleViewH)
        let daytitleview = DayTitleView(frame: titleframe, titles: dayTitles)
        daytitleview.backgroundColor = .white
        return daytitleview
    }()
    
    private lazy var monthtitleView : MonthView = {
        let titleframe = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let monthView = MonthView(frame: titleframe)
        return monthView
    }()
    
    private lazy var calendarView : CalendarView = {
        let frame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + 2 * kTitleViewH, width: kScreenW , height: kCalendarViewH)
        let calendarView = CalendarView(frame: frame)
        return calendarView
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
}

extension HomeViewController{
    private func setupUI(){
        //MARK:-设置导航栏
        setupNavigationBar()
        //MARK:-设置scrollview日期
        view.addSubview(daytitleView)
        view.addSubview(monthtitleView)
        view.addSubview(calendarView)
    }
    
    private func setupNavigationBar(){
        self.navigationItem.title = "Calendar"
        let size = CGSize(width: 15, height: 15)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "color_palette_normal", highImageName: "color_palette_highlight", size: size)
    }
}

//MARK:-calendar view
extension HomeViewController{
    
}

