//
//  CoreDataManager.swift
//  TraveLoop
//
//  Created by Ayberk M on 7.10.2022.
//
import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private init() {}
    
    func deleteBookmark(bookmarks t: Bookmarks) {
        let request: NSFetchRequest<Bookmarks> = Bookmarks.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", t.id!.uuidString)
        
        do {
            let context = persistentContainer.viewContext
            let result = try context.fetch(request)
            if result.count > 0 {
                let bookmarks = result.first!
                context.delete(bookmarks)
                saveContext()
             
            }
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    
    func getAllBookmarks () -> [Bookmarks] {
        let request: NSFetchRequest<Bookmarks> = Bookmarks.fetchRequest()
        //let firstSort = NSSortDescriptor(key: #keyPath(Bookmarks.id), ascending: false)
        //request.sortDescriptors = [firstSort]
        var bookmarks = [Bookmarks]()
        
        do {
            bookmarks = try persistentContainer.viewContext.fetch(request)
        } catch let err {
            print(err.localizedDescription)
        }
        
        return bookmarks
    }
    
    func saveBookmark(title: String, desc: String,type: String) {
        let bookmark = Bookmarks(context: persistentContainer.viewContext)
        bookmark.title = title
        bookmark.desc = desc
        bookmark.type = type
        bookmark.id = UUID()
        saveContext()
    }
    
    
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TraveLoop")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
