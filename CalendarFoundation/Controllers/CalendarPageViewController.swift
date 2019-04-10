//
//  CalendarPageViewController.swift
//  Todo
//
//  Created by Robert Dresler on 16/11/2018.
//  Copyright © 2018 Robert Dresler. All rights reserved.
//

import UIKit

protocol CalendarPageViewControllerDelegate: class {
    func dateSelected(_ date: Date)
    func monthChanged(month: Int, year: Int)
}

class CalendarPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var collectionViewController: UIViewController {
        return CalendarCollectionViewController(monthIndex: selectedMonthIndex, selectedYear: selectedYear)
    }
    
    var selectedMonthIndex: Int = 0
    var selectedYear: Int = 0
    
    weak var calendarDelegate: CalendarPageViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        dataSource = self
        selectedMonthIndex = Date.currentMonth
        selectedYear = Date.currentYear
        calendarDelegate?.monthChanged(month: selectedMonthIndex, year: selectedYear)
        setViewControllers([collectionViewController], direction: .forward, animated: true, completion: nil)
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
        calendarDelegate?.monthChanged(month: selectedMonthIndex, year: selectedYear)
    }
    
}
