//
//  ArticleEntity.swift
//  TraveLoop
//
//  Created by Ayberk M on 29.09.2022.
//

import Foundation

struct ArticlesCellViewModel {
    
    var title: String?
    var description: String?
    var image_url: String?
}

struct Article: Decodable {
    var title: String
    var description: String
    var image_url: String
}
