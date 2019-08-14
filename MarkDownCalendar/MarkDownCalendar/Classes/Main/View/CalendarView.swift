//
//  CalendarView.swift
//  MarkDownCalendar
//
//  Created by Oscar on 2019/8/13.
//  Copyright © 2019 Oscar. All rights reserved.
//

import UIKit

private let kItemMargin : CGFloat = 10
private let kItemW = kScreenW / 7
private let kItemH = kCalendarViewH / 5
private let kHeaderViewH : CGFloat = 35
private let kFooterViewH : CGFloat = 10

private let kDateCell = "kDateCell"
private let kHeaderView = "kHeaderView"
private let kFooterView = "kFooterView"


class CalendarView: UIView{
    
    var numOfDaysInMon : [Int] = [31,28,31,30,31,30,31,31,30,31,30,31]
    var currentMon : Int = 0
    var currentYear : Int = 0
    var selectedMon : Int = 0
    var firstDayOfMon : Int = 0
    //MARK:-懒加载属性
    private lazy var collectionView : UICollectionView = {
        //layout设置
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        layout.footerReferenceSize = CGSize(width: kScreenW, height: kFooterViewH)
        
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        
        //register cell
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.register(UINib(nibName: "DateCell", bundle: nil), forCellWithReuseIdentifier: kDateCell)
        
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kHeaderView)
        
        collectionView.register(UINib(nibName: "CollectionFooterView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: kFooterView)
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
        currentYear = Calendar.current.component(.year, from: Date())
        currentMon = Calendar.current.component(.month, from: Date())
        selectedMon = currentMon - 1
        firstDayOfMon = getFirstDayOfMon()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


//MARK:-collectionView Datasource function
extension CalendarView : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numOfDaysInMon[selectedMon] + firstDayOfMon - 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kDateCell", for: indexPath) as! DateCell

        if indexPath.item < firstDayOfMon - 1{
            cell.isHidden = true
        }else{
            let calDate = indexPath.row - firstDayOfMon + 2
            cell.isHidden = false
            cell.dateLabel.text = "\(calDate)"
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat = collectionView.bounds.width / 7
        let height: CGFloat = 50
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader{
            let headerview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderView, for: indexPath)
            return headerview
        }

        let footerview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kFooterView, for: indexPath)
        return footerview
        
    }
    
}

//MARK:-setup UI
extension CalendarView{
    private func setupUI(){
        addSubview(collectionView)
        collectionView.backgroundColor = .clear
    }
}

//MARK:-https://stackoverflow.com/questions/37093134/get-the-first-day-of-a-month-in-swift
//MARK:-用于请求月份第一天
extension CalendarView{
    private func getFirstDayOfMon() -> Int {
        let day = ("\(currentYear)-\(currentMon)-01".date?.firstDayOfTheMonth.weekday)!
        return day
    }
}

extension Date {
    var weekday: Int {
        return Calendar.current.component(.weekday, from: self)
    }
    var firstDayOfTheMonth: Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
    }
}
extension String {
    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    var date: Date? {
        return String.dateFormatter.date(from: self)
    }
}

