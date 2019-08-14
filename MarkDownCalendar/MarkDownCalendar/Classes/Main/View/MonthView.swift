//
//  MonthView.swift
//  MarkDownCalendar
//
//  Created by Oscar on 2019/8/12.
//  Copyright © 2019 Oscar. All rights reserved.
//

import UIKit

//MARK:-设置在titleviews上面的monthview 月份查看
class MonthView: UIView {
    let monthArr = ["Jan","Feb","Mar","Apr","May","Jun","Junl","Aug","Sep","Oct","Nov","Dec"]
    var currentMonthIndex = 0
    var currentYear = 0
    
    //MARK:-懒加载label 左右按钮
    private lazy var titleView : UIView = {
        let titleView = UIView()
        titleView.backgroundColor = UIColor(R: 233, G: 233, B: 216)
        return titleView
    }()
    
    private lazy var lbName : UILabel = {
        let lb = UILabel()
        lb.text = "default"
        lb.textColor = UIColor(R: 218, G: 84, B: 91)
        lb.textAlignment = .center
        lb.font = UIFont.systemFont(ofSize: 16)
        return lb
    }()
    
    private lazy var rightBtn : UIButton = {
        let rightbtn = UIButton()
        rightbtn.setTitle(">", for: .normal)
        rightbtn.setTitleColor(.white, for: .normal)
        rightbtn.setTitleColor(.black, for: .highlighted)
        rightbtn.addTarget(self, action: #selector(btnAction(sender:)), for: .touchUpInside)
        
        return rightbtn
    }()
    
    private lazy var leftBtn : UIButton = {
        let leftbtn = UIButton()
        leftbtn.setTitle("<", for: .normal)
        leftbtn.setTitleColor(.white, for: .normal)
        leftbtn.setTitleColor(.black, for: .highlighted)
        leftbtn.addTarget(self, action: #selector(btnAction(sender:)), for: .touchUpInside)
        
        return leftbtn
    }()
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        currentMonthIndex = Calendar.current.component(.month, from: Date()) - 1
        currentYear = Calendar.current.component(.year, from: Date())
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MonthView{
    @objc func btnAction(sender: UIButton ){
        if sender == rightBtn{
            print("rightBtn")
        }else{
            print("leftBtn")
        }
    }
}

extension MonthView{
    private func setupUI(){
        titleView.frame = bounds
        self.addSubview(titleView)
        //设置日历的titleview
        setupTitleButton()
    }
    
    private func setupTitleButton(){
        //给title设置
        lbName.frame = bounds
        titleView.addSubview(lbName)
        lbName.text="\(monthArr[currentMonthIndex])   \(currentYear)"
        
        //给日历左右按钮设置
        rightBtn.frame = CGRect(x: kScreenW-80, y: bounds.minY, width: 80, height: bounds.height)
        titleView.addSubview(rightBtn)
        leftBtn.frame = CGRect(x: 0, y: bounds.minY, width: 80, height: bounds.height)
        titleView.addSubview(leftBtn)
    }
}

