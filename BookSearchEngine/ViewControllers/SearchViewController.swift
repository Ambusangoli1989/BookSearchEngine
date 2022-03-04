//
//  SearchViewController.swift
//  BookSearchEngine
//
//  Created by ambu sangoli on 3/1/22.
//

import UIKit
import CoreData
import MotionToastView

class SearchViewController: UIViewController,UITextFieldDelegate, NSFetchedResultsControllerDelegate {
    
    //MARK: IBoutlet for searchtextfield
    @IBOutlet weak var searchTextField: UITextField!
    
    //MARK: Appication Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Adding target to textfield
        self.searchTextField.delegate = self
    }
    
    //MARK: IBAction for book search
    @IBAction func search(_ sender: Any) {
        self.searchBook()
    }
    
    //MARK: UITextfield Delegates
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        searchBook()
        return true
    }
    
    //MARK: This function is to fetch local data for searching book into before API call
    func getLocalData() -> [[ String : AnyObject ]] {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BookData")
        fetchRequest.returnsObjectsAsFaults = false
        var myArray = [[ String : AnyObject ]]()
        
        do {
            print(fetchRequest)
            
            let result = try CoreDataStack.sharedInstance.persistentContainer.viewContext.fetch(fetchRequest)
            
            for i in 0 ... result.count{
                if (i == 0) { } else {
                    
                    let entityModel = result as? [NSManagedObject]
                    let titleIs = entityModel?[i - 1].value(forKey: "title")
                    let authorName = entityModel?[i - 1].value(forKey: "authorname")
                    let publishYear = entityModel?[i - 1].value(forKey: "publishyear")
                    let coverImage = entityModel?[i - 1].value(forKey: "coveri")
                    
                    let dictionaryA = [
                        "title": titleIs,
                        "authorname": authorName,
                        "publishyear": publishYear,
                        "coveri": coverImage
                    ]
                    myArray.append(dictionaryA as [String : AnyObject])
                }
            }
        } catch {
            print("Fetching data Failed")
        }
        return myArray
    }
    
    //MARK: This Function is to search user inputs either in local database or through API call
    func searchBook() {
        
        if (searchTextField.text == "") {
        
        MotionToast(message: "Please type something", toastType: .error, toastGravity:.centre, toastCornerRadius: 12)
            
            return
        } else {
            if self.getLocalData().isEmpty != true {
                let searchPredicate = NSPredicate(format: "title CONTAINS[C] %@", searchTextField.text!)
                let filteredArray = self.getLocalData().filter { searchPredicate.evaluate(with: $0) };
                if (filteredArray.isEmpty != true) {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "SearchResultViewController") as! SearchResultViewController
                    vc.bookSearchLocalData = filteredArray
                    vc.searchStrng = searchTextField.text!
                    self.navigationController?.pushViewController(vc,animated: true)
                    
                } else {
                    self.callSearchBookAPI(searchStr: searchTextField.text!)
                }
            } else {
                self.callSearchBookAPI(searchStr: searchTextField.text!)
            }
        }
    }
    
    //MARK: Search API call with USER imput
    // Params: Search Keyword, Limit(which is set for now
    // Response: response is based on user search keyword sent from the server(openlibrary).
    func callSearchBookAPI(searchStr:String) {
        ERProgressHud.shared.show()
        let searchString = searchStr.replacingOccurrences(of: " ", with: "+")
        APIManager.sharedInstance.makeRequestTosearchBookByString(param: searchString + "&limit=10") { (success, response,statusCode) in
            if(success) {
                ERProgressHud.shared.hide()
                
                if let responseData = response as? Dictionary<String, Any> {
                    var jsonData: Data? = nil
                    do {
                        jsonData = try JSONSerialization.data(
                            withJSONObject: responseData as Any,
                            options: .prettyPrinted)
                        do{
                            let jsonDataModels = try JSONDecoder().decode(SearchResultModel.self, from: jsonData!)
                            
                            self.saveInCoreDataWith(bookArray: jsonDataModels.docs!)
                            
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let vc = storyboard.instantiateViewController(withIdentifier: "SearchResultViewController") as! SearchResultViewController
                            vc.bookSearchModel = jsonDataModels
                            self.navigationController?.pushViewController(vc,animated: true)
                            
                        }catch {
                            print(error)
                        }
                    } catch {
                        print(error)
                    }
                }
            } else {
                ERProgressHud.shared.hide()
            }
        }
    }
    
    // Saves book data in the coredata
    // Params: Authorname, Booktitle, BookCover, publish year and key
    // Response: response is based on user search keyword sent from the server.
    private func saveInCoreDataWith(bookArray: [Doc]) {
        
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        for bookArrays in bookArray {
            
            let bookResult = NSEntityDescription.insertNewObject(forEntityName: "BookData", into: context)
            bookResult.setValue(bookArrays.authorName?.first, forKey: "authorname")
            bookResult.setValue(bookArrays.title!, forKey: "title")
            bookResult.setValue("\(bookArrays.publishYear?.first?.description ?? "")" , forKey: "publishyear")
            bookResult.setValue("\(bookArrays.coverI?.description ?? "" )", forKey: "coveri")
            bookResult.setValue(bookArrays.key!, forKey: "key")
            
        }
        do {
            try context.save()
            print("Success")
        } catch {
            print("Error saving: \(error)")
        }
    }
    
    //MARK: This function is to clear local data completely
    private func clearData() {
        do {
            
            let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"BookData")
            do {
                let objects  = try context.fetch(fetchRequest) as? [NSManagedObject]
                _ = objects.map{$0.map{context.delete($0)}}
                CoreDataStack.sharedInstance.saveContext()
            } catch let error {
                print("ERROR DELETING : \(error)")
            }
        }
    }
}
