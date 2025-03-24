//
//  InfiniteSearchViewModel.swift
//  InfiniteSearch
//
//  Created by Poonam on 22/03/25.
//
import Foundation
import SwiftUI
import SwiftUICore
import OSLog

enum status {
    case loading
    case success
    case failure(Error)
}

fileprivate let API_Key = "675894853ae8ec6c242fa4c077bcf4a0"

 @MainActor final class InfiniteSearchViewModel: ObservableObject {
    
    @Published var response : [NestedPhoto] = []
    private var totalPages : Int = 10
     let logger = Logger()
     
    func fetchPhotos(_ page: Int, _ search_term: String)  async throws {
        
        let url_string = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(API_Key)&text=\(search_term)&extras=url_s&format=json&nojsoncallback=1&page=\(page)&per_page=12"
                
        let (data, _) = try await URLSession.shared.data(for: URLRequest.init(url: URL(string: url_string)!))
        let wholeDataSet : Photos =  try JSONDecoder().decode(Photos.self, from: data)
        totalPages = wholeDataSet.photos.pages
        self.response = wholeDataSet.photos.photo
    }

     
     func fetchNextSetOfData(_ page: Int, _ search_term: String)  async throws {
         logger.info("\(page)")
         if page < totalPages {
             let url_string = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(API_Key)&text=\(search_term)&extras=url_s&format=json&nojsoncallback=1&page=\(page)&per_page=12"
                     
             let (data, _) = try await URLSession.shared.data(for: URLRequest.init(url: URL(string: url_string)!))
             let nextDataSet : Photos =  try JSONDecoder().decode(Photos.self, from: data)
             self.response += nextDataSet.photos.photo
         }
     }
}

/*
//https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=675894853ae8ec6c242fa4c077bcf4a0&text=dogs&extras=url_s&format=json&nojsoncallback=1
*/
