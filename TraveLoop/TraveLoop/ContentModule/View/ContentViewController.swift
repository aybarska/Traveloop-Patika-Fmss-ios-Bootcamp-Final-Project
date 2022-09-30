//
//  ContentViewController.swift
//  TraveLoop
//
//  Created by Ayberk M on 30.09.2022.
//

import UIKit

class ContentViewController: UIViewController {

 var moduleMethod = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print(moduleMethod)
        makeUI()
    }
    

}

private extension ContentViewController {
    func makeUI() {
        self.navigationController?.navigationBar.topItem?.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Source Sans Pro", size: 30)!], for: .normal)
        bgColor()
    }
    
    func bgColor() {
        self.view.backgroundColor = UIColor(red: 0.9765, green: 0.9765, blue: 0.9765, alpha: 1.0)
        //collectionView.backgroundColor = UIColor(red: 0.9765, green: 0.9765, blue: 0.9765, alpha: 1.0)
    }
}

