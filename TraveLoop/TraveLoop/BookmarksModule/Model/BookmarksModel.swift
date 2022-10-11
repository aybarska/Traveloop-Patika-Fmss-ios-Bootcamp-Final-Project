//
//  BookmarksModel.swift
//  TraveLoop
//
//  Created by Ayberk M on 7.10.2022.
//

import Foundation

//MARK:- Data Model for a single item
struct BookmarksModel {
    let title: String
    let desc: String
    let type: String
   

    
    init(title: String, desc: String,type: String) {
      self.title = title
      self.desc = desc
      self.type = type
       
    }
    
    
}
