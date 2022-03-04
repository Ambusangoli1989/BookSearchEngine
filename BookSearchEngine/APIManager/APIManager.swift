//
//  APIManager.swift
//  BookSearchEngine
//
//  Created by ambu sangoli on 3/1/22.
//

import Foundation
import UIKit
import Alamofire

class APIManager : NSObject {
    
    // Shared Instance
    static let sharedInstance = APIManager()
    
    // MARK: URLRequestConvertible
    enum Router: URLRequestConvertible {
        
        // Api Base Url fron Constant
        static let baseURLString = BASE_URL

        //Search
        case searchBookByString(String)



        // Api Methods
        var method: HTTPMethod {
            switch self {
            case .searchBookByString:
                return .get
            }
        }
            
        // Get the URL path
        var path: String {
            switch self {
            case .searchBookByString(let searchStr):
                return "/"+API_END_SEARCH_END+searchStr
            }
        }
        
        //Generates a URL request object with the token embeded in the header.
        func asURLRequest() throws -> URLRequest {
            
            let base = URL(string:Router.baseURLString)!
            let baseAppend = base.appendingPathComponent(path).absoluteString.removingPercentEncoding
            let url = URL(string: baseAppend!)
            var urlRequest = URLRequest(url: url!)
            urlRequest.httpMethod = method.rawValue
            
            switch self {
            case .searchBookByString(_):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
            }
            print(urlRequest)
            return urlRequest
        }
    }
    
        
    // Completion Handlers
    typealias completionHandlerWithSuccess = (_ success:Bool) -> Void
    typealias completionHandlerWithSuccessAndErrorMessage = (_ success:Bool, _ errorMessage: String) -> Void
    typealias completionHandlerWithSuccessAndMessage = (_ success:Bool,_ message: NSDictionary) -> Void
    typealias completionHandlerWithResponse = (HTTPURLResponse) -> Void
    typealias completionHandlerWithResponseAndError = (HTTPURLResponse?, NSError?) -> Void
    typealias completionHandlerWithSuccessAndResultArray = (_ success:Bool, _ results: NSArray) -> Void
    typealias completionHandlerWithSuccessAndResultsArray = (_ success:Bool, _ result_1: NSArray, _ result_2: NSArray) -> Void
    typealias completionHandlerWithStatusCode = (_ success:Bool,_ message: NSDictionary,_ statusCode: Int) -> Void
        
    // SearchBookApi
    func makeRequestTosearchBookByString(param: String, completion: @escaping completionHandlerWithStatusCode) {
           
           AF.request(Router.searchBookByString(param))
               .responseJSON { response in
                   switch response.result {
                   case .success(let JSON):
                       ERProgressHud.shared.hide()
                       let statusCode = response.response?.statusCode
                       guard let jsonData =  JSON  as? NSDictionary else {
                           APIManager.sharedInstance.showAlertWithMessage(message: ERROR_MESSAGE_DEFAULT)
                           return
                       }
                       if statusCode == SUCCESS_CODE_200{
                           completion(true, jsonData, statusCode!)
                       }  else {
                           APIManager.sharedInstance.showAlertWithMessage(message: self.choooseMessageForErrorCode(errorCode: statusCode!))
                       }
                   case .failure( _):
                       completion(false,[:],0)
                   }
               }
       }
    
    // Shows alert view according to the code sent
    // Params:
    // code:code is the response code sent from the server.
    func showAlertWithCode(code:Int)  {
        let alertView = UIAlertController(title: "Alert",message: self.choooseMessageForErrorCode(errorCode: code) as String, preferredStyle:.alert)
        alertView.setTint(color: PURPLE)
        alertView.setBackgroundColor(color: .white)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertView.addAction(okAction)
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first!
        var vc = window.rootViewController;
        while (vc!.presentedViewController != nil){
            vc = vc!.presentedViewController;
        }
        vc?.present(alertView, animated: true, completion: nil)
    }
    
    // Shows alert view with the message sent
    // Params:
    // message is the text to shown in the alert view.
    func showAlertWithMessage(message:String)  {
        let alertView = UIAlertController(title: nil,
                                          message: message, preferredStyle:.alert)
        alertView.setTint(color: PURPLE)
        alertView.setBackgroundColor(color: .white)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertView.addAction(okAction)
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first!
        var vc = window.rootViewController;
        while (vc!.presentedViewController != nil){
            vc = vc!.presentedViewController;
        }
        vc?.present(alertView, animated: true, completion: nil)
    }
    
    // Method for Error Code with Proper Appropriate String
    // Params:
    // errorCode:errorCode is the response code sent from the server.
    // Returns a String according to the error code.
    func choooseMessageForErrorCode(errorCode: Int) -> String {
        var message: String = ""
        switch errorCode {
        case SUCCESS_CODE_200:
            message = SUCCESS_MESSAGE_FOR_200
        case ERROR_CODE_400:
            message = ERROR_MESSAGE_FOR_400
            break
        case ERROR_CODE_403:
            message = ERROR_MESSAGE_FOR_403
        case ERROR_CODE_500:
            message = ERROR_MESSAGE_FOR_500
        case ERROR_CODE_504:
            message = ERROR_MESSAGE_FOR_504
        default:
            message = ERROR_MESSAGE_DEFAULT
        }
        return message;
    }
    
    
    
}

