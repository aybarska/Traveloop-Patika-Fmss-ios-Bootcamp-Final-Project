//
//  BookmarksViewModel.swift
//  TraveLoop
//
//  Created by Ayberk M on 7.10.2022.
//

import Foundation

protocol BookmarksViewModelViewProtocol:AnyObject {
   // func didCellItemFetch(_ items: [ToDoCellViewModel])
    
    func refreshView()
    
}


class BookmarksViewModel {
//    private let model = ToDoModel()
   weak var viewDelegate: BookmarksViewModelViewProtocol?
    
   func didViewLoad() {
        //model.fetchData()
    }
    
    func didClickItem(at index: Int) {
        let selectedItem = bookmarkAtIndex(index)
        //navigate ?
        print(selectedItem)
    }
    
    var bookmark = [Bookmarks]()
       
       var count: Int {
           return bookmark.count
       }
       
       init() {
           self.refreshData()
       }
       
       func bookmarkAtIndex(_ index: Int) -> Bookmarks {
           return bookmark[index]
       }
       
       func refreshData() {
           self.bookmark = CoreDataManager.shared.getAllBookmarks()
       }
       
       
       func deleteBookmark(_ index: Int) {
           CoreDataManager.shared.deleteBookmark(bookmarks: bookmark[index])
            self.refreshData()
       }
    
    
    
}
