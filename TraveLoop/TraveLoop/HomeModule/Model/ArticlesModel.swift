//
//  ArticlesModel.swift
//  TraveLoop
//
//  Created by Ayberk M on 29.09.2022.
//

import Foundation

protocol ArticlesModelProtocol:AnyObject {
    func didDataFetchProcessFinish(_ isSuccess: Bool)
}

class ArticlesModel {
    weak var delegate: ArticlesModelProtocol?
    var articles: [Article] = []
    
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
                self?.articles = try jsonDecoder.decode([Article].self, from: data)
                self?.delegate?.didDataFetchProcessFinish(true)
            } catch {
                print("Json decode")
                self?.delegate?.didDataFetchProcessFinish(false)
            }

        }
        
        task.resume()
    }
}
