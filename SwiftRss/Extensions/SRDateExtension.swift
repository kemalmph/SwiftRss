//
//  SRDateExtension.swift
//  SwiftRss
//
//  Created by Daniel Metzing on 1/21/15.
//  Copyright (c) 2015 Daniel Metzing. All rights reserved.
//

import Foundation
import UIKit

class SRDateHelper {
    
    var displayDateFormatter : NSDateFormatter = {
            var dp = NSDateFormatter()
            dp.dateFormat = "EEE, dd MM yyyy HH:mm:ss ZZZ"
            return dp
        }()

    var compareDateFormatter : NSDateFormatter = {
        var dp = NSDateFormatter()
        dp.dateFormat = "dd:MM:yyyy HH:mm"
        return dp
        }()

    
    func dayAndTime(string : String) -> (String, String) {
        
        let date = displayDateFormatter.dateFromString(string)
        let calendar = NSCalendar.currentCalendar()
        let comp = calendar.components((.WeekdayCalendarUnit | .HourCalendarUnit | .MinuteCalendarUnit), fromDate: date!)
        
        var compareString = compareDateFormatter.stringFromDate(date!)
        
        let index = advance(string.startIndex, 3)
        var dayString = string.substringToIndex(index)
        var hourString = NSString(format: "%02d", comp.hour)
        var minuteString = NSString(format: "%02d", comp.minute)
 
        return ("\(dayString), \(hourString):\(minuteString)", compareString)

    }
}
