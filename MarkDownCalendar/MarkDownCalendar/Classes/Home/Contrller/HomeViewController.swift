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
        let titleframe = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let daytitleview = DayTitleView(frame: titleframe, titles: dayTitles)
        daytitleview.backgroundColor = .white
        return daytitleview
    }()
    /*
    private lazy var monthtitleView : MonthView = {
        let titleframe = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let monthView = MonthView(frame: titleframe)
        return monthView
    }()
    */
    private lazy var calendarView : CalendarView = {
        let frame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW , height: kCalendarViewH)
        let calendarView = CalendarView(frame: frame)
        return calendarView
    }()
    
    private lazy var calendarButton : UIButton = {
        let calendarButton = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 20))
        
        calendarButton.setTitle("calendar", for: .normal)
        calendarButton.setTitleColor(UIColor(R: 218, G: 84, B: 91), for: .normal)
        calendarButton.titleLabel?.textAlignment = .center
        calendarButton.setTitleColor(.white, for: .highlighted)
        
        return calendarButton
    }()
    
    private lazy var detailButton : UIButton = {
        let detailButton = UIButton(frame: CGRect(x: 80, y: 0, width: 80, height: 20))
        
        detailButton.setTitle("detail", for: .normal)
        detailButton.setTitleColor(UIColor(R: 218, G: 84, B: 91), for: .normal)
        detailButton.titleLabel?.textAlignment = .center
        detailButton.setTitleColor(.white, for: .highlighted)
        
        return detailButton
    }()
    
    private lazy var titleviewbutton : UIView = {
        let titleviewbutton = UIView(frame: CGRect(x: 0, y: 0, width: 160, height: 20))
        return titleviewbutton
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
        //view.addSubview(monthtitleView)
        view.addSubview(calendarView)
    }
    
    private func setupNavigationBar(){
        titleviewbutton.addSubview(detailButton)
        titleviewbutton.addSubview(calendarButton)
        self.navigationItem.titleView = titleviewbutton
        
        let size = CGSize(width: 15, height: 15)
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "color_palette_normal", highImageName: "color_palette_highlight", size: size)
    }
}

//MARK:-calendar view
extension HomeViewController{
    
}

