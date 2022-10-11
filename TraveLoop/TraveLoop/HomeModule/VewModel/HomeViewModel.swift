//
//  HomeViewModel.swift
//  TraveLoop
//
//  Created by Ayberk M on 29.09.2022.
//

import Foundation

protocol HomeViewModelViewProtocol:AnyObject {
    func didCellItemFetch(_ items: [ArticlesCellViewModel])
}

class HomeViewModel {
    private let model = ArticlesModel()
   
    weak var viewDelegate: HomeViewModelViewProtocol?
    
    init() {
        model.delegate = self
    }
    
    func didViewLoad() {
        model.fetchData()
    }
    
    func didClickItem(at index: Int) {
        let selectedItem = model.articles[index]
        print(selectedItem)
    }
    
    func articleAtIndex(_ index: Int) -> Value{
        return model.articles[index]
    }
    
}

private extension HomeViewModel {
    func makeViewBasedModel(_ articles: [Value]) -> [ArticlesCellViewModel] {
        //veri var
        return articles.map{.init(title: $0.title, description: $0.description)}
    }
}

extension HomeViewModel: ArticlesModelProtocol {
    func didDataFetchProcessFinish(_ isSuccess: Bool) {
        if isSuccess {
            let articles = model.articles
            let items = makeViewBasedModel(articles)
            viewDelegate?.didCellItemFetch(items)
            //hide empty view
            //print(items) //veri var

        } else {
            print("basarisiz")
            
        //show empty view
        }
    }
}
