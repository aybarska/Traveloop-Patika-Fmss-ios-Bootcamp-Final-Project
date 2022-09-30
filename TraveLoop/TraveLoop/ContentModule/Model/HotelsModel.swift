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
        
        guard let url = URL.init(string: "https://jsonplaceholder.typicode.com/posts") else {
            delegate?.didDataFetchProcessFinish(false)
            return
        }
        
        
        var request: URLRequest = .init(url: url)
        request.httpMethod = "GET"
        
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
