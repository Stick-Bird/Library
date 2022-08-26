//
//  LibraryModel.swift
//  Library
//
//  Created by user on 2022-08-25.
//

import Foundation

class LibraryModel : ObservableObject{
    
    @Published var books = [Book]()
    
    init() {
        
        // create an instance of data service and get the data
        self.books = DataService.getLocalData()
        
    }
    

    
    /// Update the specified book's rating. Does nothing if `forId` is invalid.
    func updateRating(forId: Int, rating: Int) {
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].rating = rating
        }
    }
    
    /// Update the specified book's favourite status. Does nothing if `forId` is invalid.
    func updateFavourite(forId: Int) {
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].isFavourite.toggle()
        }
    }
    
    /// Update the specified book's current page. Does nothing if `forId` is invalid.
    func updatePage(forId: Int, page: Int) {
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].currentPage = page
        }
    }
}
