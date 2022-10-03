//
//  ContentViewController.swift
//  TraveLoop
//
//  Created by Ayberk M on 30.09.2022.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let viewModel = ContentViewModel()
    
    private var items: [HotelCellViewModel] = []
    var moduleMethod = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(moduleMethod)
        viewModel.viewDelegate = self
        viewModel.didViewLoad()
        makeUI()
    }
    

}

private extension ContentViewController {
    func makeUI() {
        bgColor()
        tableView.delegate = self
        tableView.dataSource = self
        registerCell()
        self.navigationController?.navigationBar.topItem?.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Source Sans Pro", size: 30)!], for: .normal)
        
    }
    
    func registerCell() {
        tableView.register(.init(nibName: "ContentTableViewCell", bundle: nil), forCellReuseIdentifier: "ContentTableViewCell")
    }

    
    func bgColor() {
        self.view.backgroundColor = UIColor(red: 0.9765, green: 0.9765, blue: 0.9765, alpha: 1.0)
        tableView.backgroundColor = UIColor(red: 0.9765, green: 0.9765, blue: 0.9765, alpha: 1.0)
    }
}

extension ContentViewController: ContentViewModelViewProtocol {
    
    func didCellItemFetch(_ items: [HotelCellViewModel]) {
        self.items = items
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showEmptyView() {
        // has to be in main
        DispatchQueue.main.async {
//        let noDataImageView = UIImageView(image: UIImage(named: "noData2"))
//            noDataImageView.contentMode = .scaleAspectFit
//        self.tableView.backgroundView = noDataImageView
        }
    }
    
    func hideEmptyView() {
    
    }
    
}

extension ContentViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didClickItem(at: indexPath.row)
        
    }
}

extension ContentViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentTableViewCell") as! ContentTableViewCell
     
        cell.titleLabel.text = items[indexPath.row].hotelName
        cell.descriptionLabel.text = items[indexPath.row].address
        cell.imageUrl = items[indexPath.row].mainPhotoURL ?? ""
        
        return cell
    }
    
}



