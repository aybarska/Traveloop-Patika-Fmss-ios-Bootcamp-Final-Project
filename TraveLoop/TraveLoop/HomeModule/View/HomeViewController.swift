//
//  ViewController.swift
//  TraveLoop
//
//  Created by Ayberk M on 28.09.2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var banner: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }

}

private extension HomeViewController {
    func makeUI() {
        
        bg.layer.shadowColor = UIColor(red: 0.138, green: 0.138, blue: 0.138, alpha: 0.4).cgColor
        bg.layer.shadowOpacity = 1
        bg.layer.shadowRadius = 20
        bg.layer.shadowOffset = CGSize(width: 0, height: 5)
        bg.layer.masksToBounds = false
    }
}


