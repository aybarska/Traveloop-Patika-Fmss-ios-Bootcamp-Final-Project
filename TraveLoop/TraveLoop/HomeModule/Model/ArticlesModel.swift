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
    var articles: [Value] = []
    
    func fetchData() {
        
        let headers = [
            "X-RapidAPI-Key": "d7ab706bdemsh3e5da9618095ddbp14831bjsn2e1308929f9e",
            "X-RapidAPI-Host": "contextualwebsearch-websearch-v1.p.rapidapi.com"
        ]
        
        guard let url = URL.init(string: "https://contextualwebsearch-websearch-v1.p.rapidapi.com/api/search/NewsSearchAPI?q=travel%20places&pageNumber=1&pageSize=20&autoCorrect=true&safeSearch=true&fromPublishedDate=null&toPublishedDate=null") else {
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
                   let articleData = try jsonDecoder.decode(Article.self, from: data)
                   self?.articles = articleData.value
                   self?.delegate?.didDataFetchProcessFinish(true)
               } catch {
                   print(error)
                   self?.delegate?.didDataFetchProcessFinish(false)
               }


        }
        
        task.resume()
    }
}
