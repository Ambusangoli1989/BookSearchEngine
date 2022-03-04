//
//  SearchResultViewController.swift
//  BookSearchEngine
//
//  Created by ambu sangoli on 3/1/22.
//

import UIKit
import SDWebImage
import CoreData

class SearchResultViewController: UIViewController {

    //MARK: IBoutlet for searchtextfield
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Search model variable for local and remote
    var bookSearchModel : SearchResultModel?
    var bookSearchLocalData = [[ String : AnyObject ]]()
    var searchStrng = String()

    //MARK: Appication Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        
        //Set Page title
        self.title = "Search Result"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (bookSearchLocalData.isEmpty != true) {
            self.collectionView.reloadData()
        }
    }
    
    func setupViews(){
      //  self.collectionView.reloadData()
    }
    
}

//MARK: UIcollectionview Delegates
extension SearchResultViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (bookSearchLocalData.isEmpty != true) {
            self.collectionView.reloadData()
            return (self.bookSearchLocalData.count )
        } else {
        return (self.bookSearchModel?.docs?.count ?? 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        
        if (bookSearchLocalData.count > 0 ) {
            let bookInfo = self.bookSearchLocalData[indexPath.row]
            
            if bookSearchLocalData[indexPath.row]["coveri"]?.description.isBlank == nil || bookSearchLocalData[indexPath.row]["coveri"]?.description?.isEmpty == true {
            
                cell.bookCoverImg.image = UIImage(named: "dummy_cover")!
            
            } else {
                
                cell.bookCoverImg?.sd_setImage(with: URL(string: COVER_IMAGE_URL + (bookInfo["coveri"] as! String) + "-L.jpg" ))
                cell.bookCoverImg?.backgroundColor = .darkGray
            
            }
            
            if let bookTitle = bookInfo["title"] as? String {
                cell.bookNameLbl.text = bookTitle
            }

            //Title Change if from local database
            self.title = "local Search"
            
            //Add navbar button if results from local
            let searchRemoteBtn = UIBarButtonItem(title: "Search Online", style: .plain, target: self, action: #selector(self.searchRemote))
            self.navigationItem.rightBarButtonItem  = searchRemoteBtn
            
        } else {
            
            //Title Change if from local database
            self.title = "Search Result"

        
        let bookInfo = self.bookSearchModel?.docs![indexPath.row]
        if let bookData = self.bookSearchModel?.docs![indexPath.row].coverI {
            cell.bookCoverImg?.sd_setImage(with: URL(string: COVER_IMAGE_URL + String(bookData) + "-L.jpg" ))
            print(COVER_IMAGE_URL + String(describing: bookData) + "-L.jpg")
            cell.bookCoverImg?.backgroundColor = .darkGray
            } else {
                cell.bookCoverImg.image = UIImage(named: "dummy_cover")!
            }
        
        if let bookTitle = bookInfo?.title {
            cell.bookNameLbl.text = bookTitle
        }

        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // self.didSelectPhoto(index: indexPath.item)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BookDetailViewController") as! BookDetailViewController
        if bookSearchLocalData.isEmpty != true {
            vc.bookSearchLocalData = bookSearchLocalData[indexPath.row]
        } else {
            vc.bookSearchModel = self.bookSearchModel?.docs![indexPath.row]
        }
        self.navigationController?.pushViewController(vc,animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let noOfCellsInRow = 2
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            let totalSpace = flowLayout.sectionInset.left
                + flowLayout.sectionInset.right
                + (10 * CGFloat(noOfCellsInRow - 1))
            let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
            return CGSize(width: size, height: size + 44)
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }
    
    func didSelectPhoto(index: Int) {
    
    }
    
    @objc func searchRemote(sender: AnyObject) {

        ERProgressHud.shared.show()

        //MARK: Search API call with USER imput
        // Params: Search Keyword, Limit(which is set for now
        // Response: response is based on user search keyword sent from the server(openlibrary).
            let searchString = searchStrng.replacingOccurrences(of: " ", with: "+")
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
    
}



