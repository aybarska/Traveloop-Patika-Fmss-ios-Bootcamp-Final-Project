//
//  HotelsEntity.swift
//  TraveLoop
//
//  Created by Ayberk M on 30.09.2022.
//

import Foundation


import Foundation

struct HotelCellViewModel {
    
    var title: String?
    var description: String?
    
}

struct Hotel: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
