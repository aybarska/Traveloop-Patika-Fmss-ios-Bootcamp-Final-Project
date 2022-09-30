//
//  ArticlesCollectionViewCell.swift
//  TraveLoop
//
//  Created by Ayberk M on 28.09.2022.
//

import UIKit

class ArticlesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelTag: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    static let identifier = "ArticlesCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        shapeAndShadow(desiredView: view)
    }
    
    static func nib()-> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    public func shapeAndShadow(desiredView: UIView) {
        //cool shape and lil shadow
        desiredView.layer.cornerRadius = 10
        desiredView.clipsToBounds = true
        desiredView.layer.shadowRadius = 10
        desiredView.layer.shadowOpacity = 6.0
        desiredView.layer.shadowOffset = CGSize(width: 3, height: 3)
        desiredView.layer.shadowColor = UIColor.black.cgColor
    }
}
