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
    var imageUrl: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        shapeImage(desiredImage: cellBgImageView)
    }
    
    override func draw(_ rect: CGRect) {
        //make gradient size equal to imageview size
        super.draw(rect)
        drawGradient(desiredView: cellBgImageView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func drawGradient(desiredView: UIView) {
        //creates new view and puts front of desired one with gradient
        var bottomColor = UIColor.black.cgColor
        if self.traitCollection.userInterfaceStyle == .dark {
            //if client is in dark mode, gradient will be grayish
            bottomColor = UIColor.darkGray.cgColor
        }
        
        let view = UIView(frame: desiredView.frame)
        let gradient = CAGradientLayer()
        gradient.frame = view.frame
        gradient.colors = [UIColor.clear.cgColor, bottomColor]
        gradient.locations = [0.0, 1.0]
        view.layer.insertSublayer(gradient, at: 0)
        desiredView.addSubview(view)
        desiredView.bringSubviewToFront(view)
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
