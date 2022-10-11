//
//  BookmarksViewController.swift
//  TraveLoop
//
//  Created by Ayberk M on 7.10.2022.
//

import UIKit

class BookmarksViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var staticTitleLabel: UILabel!
    private let viewModel = BookmarksViewModel()
    
    var selectedIndex: Int?
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadTable()
        makeUI()


        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadTable()
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    
    func reloadTable() {
        viewModel.refreshData()
        self.tableView.reloadData()
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
private extension BookmarksViewController {
    func makeUI() {
        bgColor()
        tableView.delegate = self
        tableView.dataSource = self
        registerCell()
        tableView.rowHeight = 230.0
    }
    
    func registerCell() {
        tableView.register(.init(nibName: "BookmarksTableViewCell", bundle: nil), forCellReuseIdentifier: "BookmarksTableViewCell")
    }

    
    func bgColor() {
        self.view.backgroundColor = UIColor(red: 0.9765, green: 0.9765, blue: 0.9765, alpha: 1.0)
        tableView.backgroundColor = UIColor(red: 0.9765, green: 0.9765, blue: 0.9765, alpha: 1.0)
   
    }
}

extension BookmarksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarksTableViewCell") as! BookmarksTableViewCell
        let item = viewModel.bookmarkAtIndex(indexPath.row)
        cell.titleLabel.text = item.title
        cell.descLabel.text = item.desc
        cell.typeLabel.text = item.type
        return cell
    }
    
}

extension BookmarksViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        let backItem = UIBarButtonItem()
        backItem.tintColor = .black
        navigationItem.backBarButtonItem = backItem
        let itemData = viewModel.bookmarkAtIndex(indexPath.row)
        detailsVC?.bookmarkObject = viewModel.bookmarkAtIndex(indexPath.row)
        detailsVC?.dataType = itemData.type!
        print(itemData.title!)
  
        //detailsVC?.titleLabel.text = itemData.title!
        //detailsVC?.descTextView.text = itemData.desc?.description
        detailsVC?.isBookmark = true
        
        self.navigationController?.pushViewController(detailsVC!, animated: true)
        
    }
}
