//
//  BookDetailViewController.swift
//  BookSearchEngine
//
//  Created by ambu sangoli on 3/3/22.
//

import UIKit
import SDWebImage

class BookDetailViewController: UIViewController {

    //MARK: Search model variable for local and remote
    var bookSearchModel : Doc?
    var bookSearchLocalData = [String : AnyObject]()

    //MARK: IBoutlet for Lable and cover image
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var authorNamelbl: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupView()
    }
    
    //Assigning Values to the labels
    func setupView() {
        
        if bookSearchLocalData.isEmpty != true {
            nameLbl.text = "Book Name - " + String(describing: bookSearchLocalData["title"]!)
            authorNamelbl.text = "Author - " + String(describing: bookSearchLocalData["authorname"]!)
            yearLbl.text = "Publish Year - " + String(describing: bookSearchLocalData["publishyear"]!)
            
            if bookSearchLocalData["coveri"]?.description.isBlank == nil || bookSearchLocalData["coveri"]?.description?.isEmpty == true {
                coverImageView.image = UIImage(named: "dummy_cover")!
            } else  {
            coverImageView.sd_setImage(with: URL(string: COVER_IMAGE_URL + (bookSearchLocalData["coveri"] as! String) + "-L.jpg" ))
            }
            
        } else {
            nameLbl.text = "Book Name - " + (bookSearchModel?.title)! 
            authorNamelbl.text = "Author - " + (bookSearchModel?.authorName?.first ?? "")
            yearLbl.text = "Publish Year - " + String(describing: bookSearchModel!.publishYear!.first!) 
           
            if bookSearchModel?.coverI == nil || ((bookSearchModel?.coverI.words.isEmpty) == nil) {
                coverImageView.image = UIImage(named: "dummy_cover")!
            } else {
            coverImageView.sd_setImage(with: URL(string: COVER_IMAGE_URL + String(describing: bookSearchModel!.coverI!) + "-L.jpg" ))
            }
        }

    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
