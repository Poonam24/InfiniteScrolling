//
//  InfiniteSearchViewModel.swift
//  InfiniteSearch
//
//  Created by Poonam on 22/03/25.
//
import Foundation
import SwiftUI
import SwiftUICore


final class InfiniteSearchViewModel: ObservableObject {

     var wholeDataSet : Photos?
    @Published var response : [NestedPhoto] = []
    
    func fetchPhotos(page: Binding<Int>, query: String)  async throws {
        
        let url_string = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=675894853ae8ec6c242fa4c077bcf4a0&text={query}&extras=url_s&format=json&nojsoncallback=1"
        
        let (data, _) = try await URLSession.shared.data(for: URLRequest.init(url: URL(string: url_string)!))
        wholeDataSet =  try JSONDecoder().decode(Photos.self, from: data)
        
        guard let wholeDataSet else {
            throw fatalError()
        }
        
        
        rec
        
        DispatchQueue.main.async {
            self.response = wholeDataSet.photos.photo
        }
    }
    

}

/*
//https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=675894853ae8ec6c242fa4c077bcf4a0&text=dogs&extras=url_s&format=json&nojsoncallback=1
*/
