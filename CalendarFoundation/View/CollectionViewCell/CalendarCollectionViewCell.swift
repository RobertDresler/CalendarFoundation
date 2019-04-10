//
//  CalendarCollectionViewCell.swift
//  Todo
//
//  Created by Robert Dresler on 29/09/2018.
//  Copyright © 2018 Robert Dresler. All rights reserved.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    var dateIndex: Int = 0
    
    func setCell(_ dayInMonth: Int) {
        label.text = String(dayInMonth)
        dateIndex = dayInMonth
    }

}
