//
//  ContentTableViewCell.swift
//  TraveLoop
//
//  Created by Ayberk M on 30.09.2022.
//

import UIKit

class ContentTableViewCell: UITableViewCell {

    @IBOutlet weak var cellBgImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
   // var imageUrl: String = "hotelsPlaceholder"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
        shapeImage(desiredImage: cellBgImageView)
        
    }
    
    override func draw(_ rect: CGRect) {
        //make gradient size equal to imageview size
        super.draw(rect)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    
    public func shapeImage(desiredImage: UIView) {
        //cool image shape
        desiredImage.layer.cornerRadius = 10
        desiredImage.clipsToBounds = true
        desiredImage.layer.shadowRadius = 10
        desiredImage.layer.shadowOpacity = 1.0
        desiredImage.layer.shadowOffset = CGSize(width: 3, height: 3)
        desiredImage.layer.shadowColor = UIColor.gray.cgColor
    }
}
