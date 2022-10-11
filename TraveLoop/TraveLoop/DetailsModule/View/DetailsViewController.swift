//
//  DetailsViewController.swift
//  TraveLoop
//
//  Created by Ayberk M on 5.10.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bookmarkButton: UIButton!
    
    var dataObjectHotel: Result?
    var dataObjectFlight: Flight?
    var dataObjectArticle: Value?
    var bookmarkObject: Bookmarks?
    var dataType: String = "Category"
    var isBookmark: Bool = false
    
    
    override func viewDidLoad() {
      
        super.viewDidLoad()
        //makeUI()
        shapeImage(desiredImage: imageView)
        if(dataType == "Hotel") {
            titleLabel.text = dataObjectHotel?.hotel_name
            descTextView.text = dataObjectHotel?.address
            imageView.image = UIImage(named: "hotelsPlaceholder")
        } else if(dataType == "Flight"){
            titleLabel.text = dataObjectFlight?.airline
            //var descText = dataObjectFlight?.from  + " -> " + dataObjectFlight?.to  + " " + dataObjectFlight?.date
            descTextView.text = "\(dataObjectFlight?.from ?? " ") -> \(dataObjectFlight?.to ?? " ") \(dataObjectFlight?.date ?? " ")"
            imageView.image = UIImage(named: "flightsPlaceholder")
        } else if(dataType == "Article"){
            titleLabel.text = dataObjectArticle?.title
            descTextView.text = dataObjectArticle?.description
            imageView.image = UIImage(named: "placeholder1")
        }
        
        if(isBookmark) {
            print("is bookmark? \(isBookmark)")
           titleLabel.text = bookmarkObject?.title
           descTextView.text = bookmarkObject?.desc
           bookmarkButton.titleLabel?.text = "Remove Bookmark"
        }
        
        tagLabel.text = dataType
        // Do any additional setup after loading the view.
    }
    
    func makeUI() {
        bookmarkButton.setTitle("Bookmark Added", for: .normal)
        isBookmark = true
        bookmarkButton.isEnabled = false
    }
    
    public func shapeImage(desiredImage: UIView) {
        //cool image shape
        desiredImage.layer.cornerRadius = 15
        desiredImage.clipsToBounds = true
        desiredImage.layer.shadowRadius = 10
        desiredImage.layer.shadowOpacity = 1.0
        desiredImage.layer.shadowOffset = CGSize(width: 3, height: 3)
        desiredImage.layer.shadowColor = UIColor.gray.cgColor
    }

    

    @IBAction func bookmarkButton(_ sender: Any) {
        if(isBookmark) {
            
            let alert = UIAlertController(title: "Careful", message: "Bookmark will be removed.", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
                print("canceled")
                //self.makeUI()
                self.bookmarkButton.setTitle("Remove Bookmark", for: .normal)
                 }))
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
                
                  CoreDataManager.shared.deleteBookmark(bookmarks: self.bookmarkObject!)
                  self.navigationController?.popViewController(animated: true)
                 }))
            
            self.present(alert, animated: true, completion: nil)

        } else {
            let bookmarkData = DetailsViewModel(title: titleLabel.text ?? "", desc: descTextView.text, type: dataType)
            bookmarkData.addBookmark()
            //self.bookmarkButton.titleLabel?.text = "Remove Bookmark"
            makeUI()
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
