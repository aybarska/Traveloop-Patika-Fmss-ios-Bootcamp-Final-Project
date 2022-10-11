//
//  BookmarksTableViewCell.swift
//  TraveLoop
//
//  Created by Ayberk M on 7.10.2022.
//

import UIKit

class BookmarksTableViewCell: UITableViewCell {

    @IBOutlet weak var typeLabel: UILabel!
    

    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        shapeImage(desiredImage: bgImageView)
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
