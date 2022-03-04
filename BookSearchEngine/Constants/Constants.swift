//
//  Constants.swift
//  BookSearchEngine
//
//  Created by ambu sangoli on 3/1/22.
//

import Foundation
import UIKit


//StoryBoards
let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)

//MARK: Base Url
let BASE_URL = "https://openlibrary.org"
let COVER_IMAGE_URL = "https://covers.openlibrary.org/b/id/"

//MARK: End Points
let API_END_SEARCH_END =  "search.json?q="

//MARK: Colors
let BLUSH = UIColor(red: 241.0 / 255.0, green: 184.0 / 255.0, blue: 166.0 / 255.0, alpha: 1.0)
let TOMATO = UIColor(red: 240.0 / 255.0, green: 89.0 / 255.0, blue: 41.0 / 255.0, alpha: 1.0)
let BROWNISH_GREY_TWO = UIColor(white: 100.0 / 255.0, alpha: 1.0)
let MEDIUM_GREY = UIColor(red: 101.0 / 255.0, green: 101.0 / 255.0, blue: 100.0 / 255.0, alpha: 1.0)
let PURPLE = UIColor(red: 105.0 / 255.0, green: 46.0 / 255.0, blue: 153.0 / 255.0, alpha: 1.0)
let ORANGE = UIColor(red: 240.0 / 255.0, green: 89.0 / 255.0, blue: 41.0 / 255.0, alpha: 1.0)
let RED = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
let WARM_GREY = UIColor(white: 145.0 / 255.0, alpha: 1.0)
let GREYISH_BROWN = UIColor(white: 88.0 / 255.0, alpha: 1.0)
let OFF_WHITE = UIColor(red: 1.0, green: 243.0 / 255.0, blue: 227.0 / 255.0, alpha: 1.0)
let WHITE_THREE = UIColor(white: 239.0 / 255.0, alpha: 1.0)

// MARK: Error Codes And Strings
let ERROR_MESSAGE_DEFAULT = "Something went wrong. Please try again."
let SUCCESS_CODE_200 = 200
let SUCCESS_MESSAGE_FOR_200 = "Response was successful"
let ERROR_CODE_400 = 400
let ERROR_MESSAGE_FOR_400 = "Bad Request."
let ERROR_CODE_403 = 403
let ERROR_MESSAGE_FOR_403 = "Your request is Forbidden"
let ERROR_CODE_500 = 500
let ERROR_MESSAGE_FOR_500 = "Internal Server Error. Please try again."
let ERROR_CODE_504 = 504
let ERROR_MESSAGE_FOR_504 = "Internal Server Error. Please try again."


