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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
