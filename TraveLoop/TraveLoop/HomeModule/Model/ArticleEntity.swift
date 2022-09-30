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
}

struct Article: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
