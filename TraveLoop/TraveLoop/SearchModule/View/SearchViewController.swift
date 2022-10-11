//
//  SearchViewController.swift
//  TraveLoop
//
//  Created by Ayberk M on 7.10.2022.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var hotelButton: UIButton!
    @IBOutlet weak var flightButton: UIButton!
    
    private let viewModel = SearchViewModel()
    private var isFlights: Bool = false
    var activityIndicator = UIActivityIndicatorView()
    
    private var itemsHotel: [HotelCellViewModel] = []
    private var itemsFlight: [FlightCellViewModel] = []
    var filteredDataHotel: [HotelCellViewModel] = []
    var filteredDataFlight: [FlightCellViewModel] = []
    var allDataFlight: [FlightCellViewModel] = []
    var allDataHotel: [HotelCellViewModel] = []
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDelegate = self
        self.search.delegate = self
        
        makeUI()
        //showEmptyView()
        setupActivityIndicator()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setupActivityIndicator() {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.color = .red
        view.addSubview(activityIndicator)
    }
    
    
    @IBAction func hotelButtonAction(_ sender: Any) {
        hotelButton.setImage(UIImage(named:"hActive"), for: .normal)
        flightButton.setImage(UIImage(named:"fPassive"), for: .normal)
        search.searchTextField.text = ""
        print("hotel")
        self.isFlights = false
        viewModel.getData(isModelFlights: false)
        self.activityIndicator.startAnimating()
    }
    
    @IBAction func flightButtonAction(_ sender: Any) {
        flightButton.setImage(UIImage(named:"fActive"), for: .normal)
        hotelButton.setImage(UIImage(named:"hPassive"), for: .normal)
        search.searchTextField.text = ""
        print("flight")
        self.isFlights = true
        viewModel.getData(isModelFlights: true)
        self.activityIndicator.startAnimating()
    }
    
}

private extension SearchViewController {
    func makeUI() {
        bgColor()
        tableView.delegate = self
        tableView.dataSource = self
        registerCell()
        self.navigationController?.navigationBar.topItem?.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Source Sans Pro", size: 30)!], for: .normal)
        tableView.rowHeight = 230.0
    }
    
    func registerCell() {
        tableView.register(.init(nibName: "ContentTableViewCell", bundle: nil), forCellReuseIdentifier: "ContentTableViewCell")
    }

    
    func bgColor() {
        self.view.backgroundColor = UIColor(red: 0.9765, green: 0.9765, blue: 0.9765, alpha: 1.0)
        tableView.backgroundColor = UIColor(red: 0.9765, green: 0.9765, blue: 0.9765, alpha: 1.0)
        search.backgroundColor =  UIColor(red: 0.9765, green: 0.9765, blue: 0.9765, alpha: 1.0)
    }
}

extension SearchViewController: SearchViewModelViewProtocol {
    
    func didCellItemFetchHotel(_ items: [HotelCellViewModel],isFlights: Bool) {
        
        self.itemsHotel = items
        self.allDataHotel = items
        
        DispatchQueue.main.async {
            self.search.placeholder = "Search by Hotel name"
            self.tableView.reloadData()
        }
    }
    
    func didCellItemFetchFlight(_ items: [FlightCellViewModel],isFlights: Bool) {
        self.itemsFlight = items
        self.allDataFlight = items

        DispatchQueue.main.async {
            self.search.placeholder = "Search by Airline"
            self.tableView.reloadData()
        }
    }

    func showEmptyView() {
        // has to be in main
        DispatchQueue.main.async {
        let noDataImageView = UIImageView(image: UIImage(named: "noData"))
            noDataImageView.contentMode = .center
            
        self.tableView.backgroundView = noDataImageView
        }
    }
    func hideLoadingView() {
        // has to be in main
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
        }
    }
    
    func hideEmptyView() {
    
    }
        
}

extension SearchViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(isFlights) {
        
            if (searchText == ""){
                filteredDataFlight = self.itemsFlight
                self.itemsFlight = self.allDataFlight
            }
            else{
                if(searchText.count > 3){
                filteredDataFlight = []
                filteredDataFlight = self.itemsFlight.filter{
                    $0.Airline!.lowercased().contains(searchText.lowercased())
                }
                self.itemsFlight = filteredDataFlight
                    if(filteredDataHotel.isEmpty) {
                        self.showEmptyView()
                    }
                }
            }

        } else {
            
            if (searchText == ""){
                filteredDataHotel = self.itemsHotel
                self.itemsHotel = allDataHotel
            }
            else{
                if(searchText.count > 3){
                filteredDataHotel = []
                filteredDataHotel = self.itemsHotel.filter{
                    $0.hotelName!.lowercased().contains(searchText.lowercased())
                }
               self.itemsHotel = filteredDataHotel
                    if(filteredDataHotel.isEmpty) {
                        self.showEmptyView()
                    }
                }
            }
            
        }

        self.tableView.reloadData()
    }
}

extension SearchViewController: UITableViewDelegate {
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

extension SearchViewController: UITableViewDataSource {
    
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




