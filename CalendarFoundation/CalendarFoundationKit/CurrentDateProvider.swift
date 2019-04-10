//
//  CurrentDateProvider.swift
//  Todo
//
//  Created by Robert Dresler on 26/11/2018.
//  Copyright © 2018 Robert Dresler. All rights reserved.
//

import Foundation

extension Date {
    
    static let currentMonth: Int = Calendar.current.component(.month, from: Date()) - 1 // 0-11
    static let currentYear: Int = Calendar.current.component(.year, from: Date())       // 2019
    static let currentDay: Int = Calendar.current.component(.day, from: Date())         // 1-31
    
}
