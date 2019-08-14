//
//  DayTitleView.swift
//  MarkDownCalendar
//
//  Created by Oscar on 2019/8/8.
//  Copyright © 2019 Oscar. All rights reserved.
//

import UIKit

let kScrollLineH : CGFloat = 0.5

class DayTitleView: UIView {
    //MARK:-定义属性
    private var titles : [String]
    private var titleLabel : [UILabel] = [UILabel]()
    //MARK:-懒加载
    private lazy var scrollView : UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.bounces = false
        return scrollview
    }()
    
    private lazy var scrollLine : UIView = {
        let lineH : CGFloat = 0.5
        let scrollline = UIView()
        scrollline.backgroundColor = UIColor.lightGray
        scrollline.frame = CGRect(x: 0, y: frame.height-lineH, width: kScreenW, height: kScrollLineH)
        return scrollline
    }()
    
    init(frame: CGRect, titles: [String]) {
        self.titles = titles
        
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DayTitleView{
    private func setupUI(){
        //添加scrollview
        addSubview(scrollView)
        addSubview(scrollLine)
        scrollView.frame = bounds
        //添加对应label
        setupLabelTitles()
    }
    
    private func setupLabelTitles(){
        let labelW : CGFloat = frame.size.width / CGFloat(titles.count)
        let labelH : CGFloat = frame.size.height
        let labelY :CGFloat = 0
        
        for (index, text) in titles.enumerated() {
            let label = UILabel()
            label.text = text
            label.tag = index
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 16.0)
            
            if index == 0 || index == 6 {
                label.textColor = .gray
            }else{
                label.textColor = UIColor(R: 218, G: 84, B: 91)
            }
            
            //label's frame
            let labelX :CGFloat = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            scrollView.addSubview(label)
        }
    }
}
