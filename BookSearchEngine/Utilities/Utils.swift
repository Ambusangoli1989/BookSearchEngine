//
//  Utils.swift
//  BookSearchEngine
//
//  Created by ambu sangoli on 3/1/22.
//

import UIKit
import Foundation

class Utils: NSObject,UINavigationControllerDelegate {
 
    // Validate Email
    // Params :
    // Email : It is the string which is to be validated
    // Returns if the email validation passed .
    class func validateEmail(email : String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }
    
    // Validate Password
    // Params :
    // Password : It is the string which is to be validated
    // Returns if the password validation passed.
    class func validatePassword(password : String) -> Bool {
        let passwordRegEx = "^(?=.*[a-z])(?=.*\\d).{8,15}$"
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordPredicate.evaluate(with: password)
    }
    
    //Validate Mobile Number
    // Params :
    // Mobile Number : It is the string which is to be validated
    // Returns if the Mobile Number validation passed.
    class func validateMobileNumber(mobileNumber : String) -> Bool {
        let PHONE_REGEX = "^[0-9+]{0,1}+[0-9]{5,16}$"//"^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: mobileNumber)
        return result
    }

    // Date Conversion into standard
    // Params :
    // isoDate : It is the ISO formate date to be converted
    // Returns the date format in the required format.
    class func convertDate(isoDate : String) -> String {
        let myFormatter = DateFormatter()
        myFormatter.timeZone = NSTimeZone(name: "GMT")! as TimeZone
        myFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        let date = myFormatter.date(from: isoDate)
        myFormatter.dateFormat = "MMMM dd @hh:mma"
        let convertedDate = myFormatter.string(from: date!)
        return convertedDate
    }
    
    // Date Conversion to iso format
    // Params :
    // isoDate : It is the standard date to be converted to ISO
    // Returns the date format in the required format.
    class func convertDateToISO(date : String) -> String {
        let myFormatter = DateFormatter()
        myFormatter.timeZone = NSTimeZone(name: "GMT")! as TimeZone
        myFormatter.dateFormat = "MMMM dd yyyy hh:mm a"
        let newDate = myFormatter.date(from: date)
        myFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        let convertedDate = myFormatter.string(from: newDate!)
        return convertedDate
    }
    
    class func convertTimestamptoDate(date:String) -> String {
        //Convert to Date
        let date = NSDate(timeIntervalSince1970: TimeInterval(date)!)
        //Date formatting
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.long
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = NSTimeZone(name: "GMT")! as TimeZone
        dateFormatter.dateFormat = "EE MMM dd, 'at'  h:mm a"
        let dateString = dateFormatter.string(from: date as Date)
        return dateString
    }
    

//    //returns Date
    class func convertStringToDate(date : String) -> Date {
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy-MM-dd"// HH:mm:ss"//"dd/MM/yyyy"
        guard let newDate = myFormatter.date(from: date) else { return Date() }
        return newDate
    }

    //return date formatted
    class func getFormattedDate(date : String) -> String {
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy-MM-dd"// HH:mm:ss"//"dd/MM/yyyy"
        guard let newDate = myFormatter.date(from: date) else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let dayString = dateFormatter.string(from: newDate as Date)
        return dayString
    }
    
    //return date formatted - "dd-MM-yyyy"
    class func getFormattedDateString(date : String) -> String {
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"//"dd/MM/yyyy"
        guard let newDate = myFormatter.date(from: date) else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dayString = dateFormatter.string(from: newDate as Date)
        return dayString
    }
    
    class func getFormattedDayString(date : String) -> String {
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"//"dd/MM/yyyy"
        guard let newDate = myFormatter.date(from: date) else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let dayString = dateFormatter.string(from: newDate as Date)
        return dayString
    }
    
    class func getFormattedTimeString(date : String) -> String {
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"//"dd/MM/yyyy"
        guard let newDate = myFormatter.date(from: date) else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        let dayString = dateFormatter.string(from: newDate as Date)
        return dayString
    }
    
    //Output : 26
    class func getDayFromTimeStamp(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        let dayString = dateFormatter.string(from: date as Date)
        return dayString
    }
    
    //Output : Feb
    class func getMonthFromTimeStamp(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        let monthSring = dateFormatter.string(from: date as Date)
        return monthSring
    }
    
    //Output : 2021
    class func getYearFromTimeStamp(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let monthSring = dateFormatter.string(from: date as Date)
        return monthSring
    }
}
