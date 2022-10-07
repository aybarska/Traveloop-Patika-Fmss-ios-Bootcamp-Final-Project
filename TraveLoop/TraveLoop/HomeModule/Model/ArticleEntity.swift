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

//struct Article: Decodable {
//    var userId: Int
//    var id: Int
//    var title: String
//    var body: String
//}

// MARK: - Welcome
struct Article: Decodable {
    let value: [Value]
}

// MARK: - Result
struct Value: Decodable {
    let title: String?
    let description: String?
    let url: String?
}
