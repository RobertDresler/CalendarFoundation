//
//  SelectDateViewController.swift
//  Todo
//
//  Created by Robert Dresler on 29/09/2018.
//  Copyright © 2018 Robert Dresler. All rights reserved.
//

import UIKit

public protocol CalendarDelegate: class {
    func dateSelected(_ date: Date?)
}

public class CalendarViewController: UIViewController {
    
    public class func instantiate() -> CalendarViewController {
        let viewController = CalendarViewController(nibName: "CalendarViewController", bundle: Bundle(identifier:  "com.robertdresler.CalendarFoundation"))
        viewController.modalPresentationStyle = .overCurrentContext
        return viewController
    }
    
    let monthArray = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
    
    public weak var delegate: CalendarDelegate?
    
    // MARK: - IBOutlets

    @IBOutlet weak var currentMonthLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    // MARK: - Override
    
    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        modalPresentationStyle = .overCurrentContext
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        let calendarVC = CalendarPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        addChild(calendarVC)
        containerView.addSubview(calendarVC.view)
        calendarVC.calendarDelegate = self
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
        view.backgroundColor = UIColor.clear
    }
    
    // MARK: - Actions

    @IBAction func deleteFinishDateButtonPressed(_ sender: Any) {
        delegate?.dateSelected(nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension CalendarViewController: CalendarPageViewControllerDelegate {
    
    func dateSelected(_ date: Date) {
        delegate?.dateSelected(date)
        dismiss(animated: true, completion: nil)
    }
    
    func monthChanged(month: Int, year: Int) {
        currentMonthLabel.text = "\(monthArray[month]) \(year)"
    }
    
}
