//
//  HotelsModel.swift
//  TraveLoop
//
//  Created by Ayberk M on 30.09.2022.
//
import Foundation

protocol HotelsModelProtocol:AnyObject {
    func didDataFetchProcessFinish(_ isSuccess: Bool)
}

class HotelsModel {
    weak var delegate: HotelsModelProtocol?
    var hotels: [Hotel] = []
    
    func fetchData() {
        let headers = [
            "X-RapidAPI-Key": "d7ab706bdemsh3e5da9618095ddbp14831bjsn2e1308929f9e",
            "X-RapidAPI-Host": "booking-com.p.rapidapi.com"
        ]
        
        guard let url = URL.init(string: "https://booking-com.p.rapidapi.com/v1/hotels/search-by-coordinates?order_by=popularity&adults_number=2&units=metric&room_number=1&checkout_date=2023-10-01&filter_by_currency=EUR&locale=en-gb&checkin_date=2023-09-30&latitude=41.015137&longitude=28.97953&children_number=2&children_ages=5%2C0&categories_filter_ids=class%3A%3A2%2Cclass%3A%3A4%2Cfree_cancellation%3A%3A1&page_number=0&include_adjacency=true") else {
            delegate?.didDataFetchProcessFinish(false)
            return
        }
        
        
        var request: URLRequest = .init(url: url)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
           let task = URLSession.shared.dataTask(with: request) {[weak self] data, response, error in
           
            guard error == nil
               else {
                self?.delegate?.didDataFetchProcessFinish(false)
                return
            }
            
            guard let data = data else {
                self?.delegate?.didDataFetchProcessFinish(false)
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                self?.hotels = try jsonDecoder.decode([Hotel].self, from: data)
                self?.delegate?.didDataFetchProcessFinish(true)
            } catch {
                self?.delegate?.didDataFetchProcessFinish(false)
            }

        }
        
        
        
        task.resume()
    }
}
