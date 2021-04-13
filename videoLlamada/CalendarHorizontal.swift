//
//  CalendarHorizontal.swift
//  videoLlamada
//
//  Created by Gio Valdes on 15/03/21.
//

import UIKit
import DateScrollPicker

extension WaintingRoom: DateScrollPickerDelegate, DateScrollPickerDataSource
{
    
    
    func setUpCalendar()
    {
        var format = DateScrollPickerFormat()
        let _width = UIScreen.main.bounds.width
        /// Number of days
        format.days = 7
        
        /// Top label date format
        format.topDateFormat = ""

        /// Medium label date format
        format.mediumDateFormat = "dd"

        /// Medium label font
        format.mediumFont = UIFont.systemFont(ofSize: 23, weight: .bold)

        /// Medium label text color
        format.mediumTextColor = UIColor.black

        /// Medium label selected text color
        format.mediumTextSelectedColor = UIColor.white

        /// Bottom label date format
        format.bottomDateFormat = "EEE"

        /// Bottom label font
        format.bottomFont = UIFont.systemFont(ofSize: 10, weight: .regular)

        /// Bottom label text color
        format.bottomTextColor = UIColor.black

        /// Bottom label selected text color
        format.bottomTextSelectedColor = UIColor.white

        /// Day radius
        format.dayRadius = 15

        /// Day background color
        format.dayBackgroundColor = UIColor.white

        /// Day background selected color
        format.dayBackgroundSelectedColor = UIColor.blue

        /// Selection animation
        format.animatedSelection = true

        /// Separator enabled
        format.separatorEnabled = true
        
        /// Separator top label date format
        format.separatorTopDateFormat = "MMM"

        /// Separator top label font
        format.separatorTopFont = UIFont.systemFont(ofSize: 10, weight: .bold)

        /// Separator top label text color
        format.separatorTopTextColor = UIColor.black

        /// Separator bottom label date format
        format.separatorBottomDateFormat = "yyyy"

        /// Separator bottom label font
        format.separatorBottomFont = UIFont.systemFont(ofSize: 8, weight: .regular)

        /// Separator bottom label text color
        format.separatorBottomTextColor = UIColor.black

        /// Separator background color
        format.separatorBackgroundColor = UIColor.lightGray.withAlphaComponent(0.2)

        
        dateScrollPicker.frame = CGRect(x: 0, y: 120, width: _width, height: 80)
        dateScrollPicker.isUserInteractionEnabled = true
        
        //dateScrollPicker.bounds = CGRect(x: 0, y: 0, width: _width, height: 50)
        
        //dateScrollPicker.draw(CGRect(x: 0, y: 0, width: 50, height: 50))
        dateScrollPicker.format = format
        dateScrollPicker.dataSource = self
        dateScrollPicker.delegate = self
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3)
        { 
            self.dateScrollPicker.selectToday()
            
            self.initWeek = self.initDay?.addDays(-3) ?? Date()
            self.finishWeek = self.initDay?.addDays(3) ?? Date()
            
            let finalStr = self.formatter.string(from: self.initWeek)  + " - " + self.formatter.string(from: self.finishWeek)
            self.labelWeeks.text = finalStr
        }
    }
    
}
