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
    var isFlights: Bool = false
    private var itemsHotel: [HotelCellViewModel] = []
    private var itemsFlight: [FlightCellViewModel] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDelegate = self
        makeUI()
        viewModel.didViewLoad(isModelFlights: isFlights)
    }
    

}

private extension ContentViewController {
    func makeUI() {
        bgColor()
        tableView.delegate = self
        tableView.dataSource = self
        registerCell()
//        self.navigationController?.navigationBar.topItem?.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Source Sans Pro", size: 30)!], for: .normal)
        tableView.rowHeight = 230.0
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
    
    func didCellItemFetchHotel(_ items: [HotelCellViewModel],isFlights: Bool) {
        self.itemsHotel = items
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didCellItemFetchFlight(_ items: [FlightCellViewModel],isFlights: Bool) {
        self.itemsFlight = items
       
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
        tableView.deselectRow(at: indexPath, animated: true)
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        let backItem = UIBarButtonItem()
        backItem.tintColor = .black
        navigationItem.backBarButtonItem = backItem
       
        if(isFlights) {
            detailsVC?.dataObjectFlight = viewModel.flightAtIndex(indexPath.row)
            detailsVC?.dataType = "Flight"
        } else {
            detailsVC?.dataObjectHotel = viewModel.hotelAtIndex(indexPath.row)
            detailsVC?.dataType = "Hotel"
        }
        self.navigationController?.pushViewController(detailsVC!, animated: true)
        
    }
}

extension ContentViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(isFlights) {
            return itemsFlight.count
        } else {
            return itemsHotel.count
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentTableViewCell") as! ContentTableViewCell
        if(isFlights) {
            cell.titleLabel.text = itemsFlight[indexPath.row].Airline
            cell.descriptionLabel.text = itemsFlight[indexPath.row].FDate
            cell.cellBgImageView.image = UIImage(named: "flightsPlaceholder")

        } else {
            cell.titleLabel.text = itemsHotel[indexPath.row].hotelName
            cell.descriptionLabel.text = itemsHotel[indexPath.row].address
            cell.cellBgImageView.image = UIImage(named: "hotelsPlaceholder")

        }
        

        
        return cell
    }
    
}



