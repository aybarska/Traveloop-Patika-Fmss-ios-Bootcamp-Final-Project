//
//  ContentViewModel.swift
//  TraveLoop
//
//  Created by Ayberk M on 30.09.2022.
//

import Foundation


protocol ContentViewModelViewProtocol:AnyObject {
    func didCellItemFetchHotel(_ items: [HotelCellViewModel], isFlights: Bool)
    func didCellItemFetchFlight(_ items: [FlightCellViewModel], isFlights: Bool)
    func showEmptyView()
    func hideEmptyView()
}


class ContentViewModel {
    private let model = DataModel()
    weak var viewDelegate: ContentViewModelViewProtocol?
    
    init(){
        model.delegate = self
    }
  

    func didViewLoad(isModelFlights: Bool) { //when view finished load
        model.fetchData(isFlights: isModelFlights)
    }
    
    func didClickItem(at index: Int) {
        let selectedItem = model.hotels[index]
        print(selectedItem)
        
    }
    
    func flightAtIndex(_ index: Int) -> Flight{
        return model.flights[index]
    }
    
    func hotelAtIndex(_ index: Int) -> Result{
        return model.hotels[index]
    }
    
}

private extension ContentViewModel {
    
    @discardableResult
    func makeViewBasedModel(_ hotels: [Result]) -> [HotelCellViewModel] {
        //make data usabe for view
        //AYB Check this map function
//        if let hotel = hotels.first {
//            return hotel.result.map { .init(hotelNameTrans: $0.hotel_name, address: $0.address, mainPhotoURL: $0.mainPhotoURL) }
//        }
//        return []
          return hotels.map { .init(hotelName: $0.hotel_name, address: $0.address, mainPhotoURL: $0.mainPhotoURL) }
    }
    
    func makeViewBasedModelFlights(_ flights: [Flight]) -> [FlightCellViewModel]  {
        //return flights map
        return flights.map { .init(From: $0.from, To:$0.to, Airline:$0.airline, FDate:$0.date ) }
    }
}

extension ContentViewModel: DataModelProtocol {
    func didDataFetchProcessFinish(_ isSuccess: Bool, isFlights: Bool) {
        //data we fetch from api
        if(isFlights == false) {
        if isSuccess {
            let hotels = model.hotels
            let items = makeViewBasedModel(hotels) //
            viewDelegate?.didCellItemFetchHotel(items, isFlights: false) //this is workin on view
            viewDelegate?.hideEmptyView()
        } else {
            viewDelegate?.showEmptyView()
        }
        } else {
            if isSuccess {
                let flights = model.flights
                let items = makeViewBasedModelFlights(flights)
                viewDelegate?.didCellItemFetchFlight(items, isFlights: true) //this is workin on view
                viewDelegate?.hideEmptyView()
            } else {
                viewDelegate?.showEmptyView()
            }
        }

    }
}
