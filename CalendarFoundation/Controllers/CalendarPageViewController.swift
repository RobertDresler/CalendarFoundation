//
//  CalendarPageViewController.swift
//  Todo
//
//  Created by Robert Dresler on 16/11/2018.
//  Copyright © 2018 Robert Dresler. All rights reserved.
//

import UIKit

class CalendarPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var collectionViewController: UIViewController {
        let controller = CalendarCollectionViewController(monthIndex: selectedMonthIndex, selectedYear: selectedYear)
        controller.dateSelected = { [weak self] date in
            self?.dateSelected(date)
        }
        controller.monthIndexChanged = { [weak self] index in
            self?.selectedMonthIndex = index
        }
        controller.yearIndexChanged = { [weak self] index in
            self?.selectedYear = index
        }
        return controller
    }
    
    var selectedMonthIndex: Int = 0
    var selectedYear: Int = 0
    
    var dateSelected: (Date) -> Void = { _ in }
    var monthChanged: (_ month: Int, _ year: Int) -> Void = { _,_  in }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        dataSource = self
        selectedMonthIndex = Date.currentMonth
        selectedYear = Date.currentYear
        monthChanged(selectedMonthIndex, selectedYear)
        setViewControllers([collectionViewController], direction: .forward, animated: true)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if Date.currentYear == selectedYear && Date.currentMonth == selectedMonthIndex { return nil }
        
        if selectedMonthIndex > 0 {
            selectedMonthIndex -= 1
        } else {
            selectedMonthIndex = 11
            selectedYear -= 1
        }
        
        return collectionViewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if selectedMonthIndex < 11 {
            selectedMonthIndex += 1
        } else {
            selectedMonthIndex = 0
            selectedYear += 1
        }
        return collectionViewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        monthChanged(selectedMonthIndex, selectedYear)
    }
    
}
