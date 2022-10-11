//
//  DetailsViewModel.swift
//  TraveLoop
//
//  Created by Ayberk M on 7.10.2022.
//
//
import Foundation

class DetailsViewModel {
    var bookmarkItem : Bookmarks?
    var title: String
    var desc: String
    var type: String

    var bookmarks = [Bookmarks]()

    init(title: String, desc: String, type: String) {
        self.title = title
        self.desc = desc
        self.type = type

    }


    func addBookmark() {
        CoreDataManager.shared.saveBookmark(title: self.title, desc: self.desc, type: self.type)
    }


    func removeBookmark(_ index: Int) {
        CoreDataManager.shared.deleteBookmark(bookmarks: bookmarks[index])
    }




}

