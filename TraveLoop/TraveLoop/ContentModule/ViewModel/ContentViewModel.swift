//
//  ContentViewModel.swift
//  TraveLoop
//
//  Created by Ayberk M on 30.09.2022.
//

import Foundation


protocol ContentViewModelViewProtocol:AnyObject {
    func didCellItemFetch(_ items: [HotelCellViewModel])
    func showEmptyView()
    func hideEmptyView()
}


class ContentViewModel {
    private let model = HotelsModel()

    weak var viewDelegate: ContentViewModelViewProtocol?
    
    init(){
        model.delegate = self
    }
    
   func didViewLoad() {
        model.fetchData()
    }
    
    func didClickItem(at index: Int) {
        let selectedItem = model.hotels[index]
        print(selectedItem)
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
}

extension ContentViewModel: HotelsModelProtocol {
    func didDataFetchProcessFinish(_ isSuccess: Bool) {
        //data we fetch from api
        
        if isSuccess {
            let hotels = model.hotels
            let items = makeViewBasedModel(hotels)
            viewDelegate?.didCellItemFetch(items)
            viewDelegate?.hideEmptyView()
        } else {
            viewDelegate?.showEmptyView()
        }

    }
}
