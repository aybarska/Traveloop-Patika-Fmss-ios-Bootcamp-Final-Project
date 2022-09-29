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
    
}

private extension HomeViewModel {
    func makeViewBasedModel(_ articles: [Article]) -> [ArticlesCellViewModel] {
        return articles.map{.init(title: $0.title, description: $0.description, image_url: $0.image_url)}
    }
}

extension HomeViewModel: ArticlesModelProtocol {
    func didDataFetchProcessFinish(_ isSuccess: Bool) {
        if isSuccess {
            let articles = model.articles
            let items = makeViewBasedModel(articles)
            viewDelegate?.didCellItemFetch(items)
            //hide empty view
            print(items)

        } else {
            print("basarisiz")

        //show empty view
        }
    }
}
