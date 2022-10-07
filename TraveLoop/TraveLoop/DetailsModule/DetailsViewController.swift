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
    var dataType: String = "Category"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        shapeImage(desiredImage: imageView)
        if(dataType == "Hotel") {
            titleLabel.text = dataObjectHotel?.hotel_name
            descTextView.text = dataObjectHotel?.address
            imageView.image = UIImage(named: "hotelsPlaceholder")
        } else {
            titleLabel.text = dataObjectFlight?.airline
            //var descText = dataObjectFlight?.from  + " -> " + dataObjectFlight?.to  + " " + dataObjectFlight?.date
            descTextView.text = "\(dataObjectFlight?.from ?? " ") -> \(dataObjectFlight?.to ?? " ") \(dataObjectFlight?.date ?? " ")"
            imageView.image = UIImage(named: "flightsPlaceholder")
        }
        
        tagLabel.text = dataType
        // Do any additional setup after loading the view.
    }
    
    func makeUI() {
        //self.navigationController?.navigationBar.topItem?.backBarButtonItem?.
        //navigationItem.backBarButtonItem?.tintColor = UIColor.whiteColor()
       // navigationItem.backBarButtonItem?.setBackgroundImage(UIImage(named: "HomeButtonBg"), for: .normal, barMetrics: .default)
        //self.navigationItem.backBarButtonItem?.setBackButtonBackgroundImage(UIImage(named: "HomeButtonBg"), for: .normal, barMetrics: .default)
        
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

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
