//
//  HotelsEntity.swift
//  TraveLoop
//
//  Created by Ayberk M on 30.09.2022.
//

import Foundation

struct HotelCellViewModel {
    var hotelName: String?
    var address: String?
    var mainPhotoURL:String?
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Hotel: Decodable {
    let result: [Result]
}

// MARK: - Result
struct Result: Decodable {
    let hotel_name: String?
    let address: String?
    let mainPhotoURL: String?
}


