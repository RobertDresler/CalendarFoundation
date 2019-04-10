//
//  Date.swift
//  Todo
//
//  Created by Robert Dresler on 02/09/2018.
//  Copyright © 2018 Robert Dresler. All rights reserved.
//

import Foundation

extension Date {
    
    func startOfDay() -> Date {
        return Calendar.current.startOfDay(for: self)
    }
    
}
