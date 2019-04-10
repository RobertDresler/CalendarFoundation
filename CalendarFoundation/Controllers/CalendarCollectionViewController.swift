//
//  CalendarCollectionViewController.swift
//  CalendarFoundation
//
//  Created by Robert Dresler on 10/04/2019.
//  Copyright © 2019 Robert Dresler. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CalendarDayCell"

class CalendarCollectionViewController: UICollectionViewController {
    
    var dateSelected: (Date) -> Void = { _ in}
    var monthIndexChanged: (Int) -> Void = { _ in }
    var yearIndexChanged: (Int) -> Void = { _ in }
    
    var numberOfDaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
    
    var selectedMonthIndex: Int // 0-11
    var selectedYear: Int
    
    var firstWeekDayOfMonth: Int { // 0-6 (Mo-Su)
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        let date = DateComponents(calendar: calendar, year: selectedYear, month: selectedMonthIndex + 1).date
        let index = calendar.component(.weekday, from: date!)
        return (index + 5) % 7
    }
    
    init(monthIndex: Int, selectedYear: Int) {
        let layout = UICollectionViewFlowLayout()
        let size = (UIScreen.main.bounds.width - 70) / 7
        layout.itemSize = CGSize(width: size, height: size)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        selectedMonthIndex = monthIndex
        self.selectedYear = selectedYear
        
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .clear
        self.collectionView!.register(UINib(nibName: "CalendarCollectionViewCell", bundle: Bundle(for: self.classForCoder)), forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        monthIndexChanged(selectedMonthIndex)
        yearIndexChanged(selectedYear)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let isFebruaryInLeapYear = selectedMonthIndex == 1 && selectedYear % 4 == 0
        return numberOfDaysInMonth[selectedMonthIndex] + firstWeekDayOfMonth + (isFebruaryInLeapYear ? 1 : 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CalendarCollectionViewCell
        
        let isCellEmpty = indexPath.row < firstWeekDayOfMonth
        cell.isHidden = isCellEmpty
        
        if !isCellEmpty {
            
            let dayInMonth = indexPath.row - firstWeekDayOfMonth + 1
            cell.setCell(dayInMonth)
            
            let isToday = Date.currentDay > dayInMonth && Date.currentMonth == selectedMonthIndex && Date.currentYear == selectedYear
            let isWeekend = indexPath.row % 7 == 5 || indexPath.row % 7 == 6
            
            if isToday {
                cell.label.textColor = #colorLiteral(red: 0.8516863585, green: 0.8466240764, blue: 0.8555780053, alpha: 1)
            } else if isWeekend {
                cell.label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            } else {
                cell.label.textColor = UIColor.black
            }
            
            cell.isUserInteractionEnabled = !isToday
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CalendarCollectionViewCell
        let selectedDate = DateComponents(calendar: Calendar.current, year: selectedYear, month: selectedMonthIndex + 1, day: cell.dateIndex).date!.startOfDay
        dateSelected(selectedDate)
        view.backgroundColor = .clear
        dismiss(animated: true)
    }
    
}
