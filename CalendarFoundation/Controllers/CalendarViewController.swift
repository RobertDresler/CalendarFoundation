//
//  SelectDateViewController.swift
//  Todo
//
//  Created by Robert Dresler on 29/09/2018.
//  Copyright © 2018 Robert Dresler. All rights reserved.
//

import UIKit

public class CalendarViewController: UIViewController {
    
    public init(dateSelectedBlock: @escaping (Date?) -> Void) {
        super.init(nibName: "CalendarViewController", bundle: Bundle(for: type(of: self)))
        modalPresentationStyle = .overCurrentContext
        dateSelected = dateSelectedBlock
    }
    
    var dateSelected: (Date?) -> Void = { _ in }
    
    @IBOutlet weak var currentMonthLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        let calendarVC = CalendarPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        calendarVC.dateSelected = { [weak self] date in
            self?.dateSelected(date)
            self?.dismiss(animated: true)
        }
        calendarVC.monthChanged = { [weak self] month, year in
            self?.currentMonthLabel.text = "\(Calendar.current.shortMonthSymbols[month]) \(year)"
        }
        addChild(calendarVC)
        containerView.addSubview(calendarVC.view)
        calendarVC.view.frame = containerView.bounds
        calendarVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            UIView.animate(withDuration: 0.5) {
                self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2457459332)
            }
        })
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        view.backgroundColor = .clear
    }
    
    // MARK: - Actions

    @IBAction func deleteFinishDateButtonPressed(_ sender: Any) {
        dateSelected(nil)
        dismiss(animated: true)
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
