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
    func makeViewBasedModel(_ hotels: [Hotel]) -> [HotelCellViewModel] {
        //make data usabe for view
        //AYB Check this map function
        return hotels.map { .init(hotelNameTrans: $0.result.hotelName, address: $0.result.address, mainPhotoURL: $0.result.mainPhotoURL) }
        
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
