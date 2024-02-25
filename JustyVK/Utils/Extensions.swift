//
//  UIApplicationExtensions.swift
//  Весточка
//
//  Created by Vladislav on 07.06.2023.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension Calendar {
    func numberOfDaysBetween(_ from: Date, and to: Date = Date()) -> Int {
        let fromDate = startOfDay(for: from)
        let toDate = startOfDay(for: to)
        let numberOfDays = dateComponents([.day], from: fromDate, to: toDate)
        
        return numberOfDays.day! + 1;
    }
    
    func getLastOnlineDateString(difference: Int, date: Date) -> String{
        let dateFormatter = DateFormatter();
        switch(difference){
        case 1:
            return getDateFormatterString(dateFormat: "сегодня в HH:mm")
        case 2:
            return getDateFormatterString(dateFormat: "вчера в HH:mm")
        case 3:
            return getDateFormatterString(dateFormat: "позавчера в HH:mm")
        case 8:
            return "неделю назад"
        default:
            return getDateFormatterString(dateFormat: "dd.MM.yy в HH:mm")
        }
        
        func getDateFormatterString(dateFormat: String) -> String{
            dateFormatter.dateFormat = dateFormat;
            return dateFormatter.string(from: date);
        }
    }
}
