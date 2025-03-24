//
//  ContentView.swift
//  InfiniteSearch
//
//  Created by Poonam on 22/03/25.
//

import SwiftUI
import OSLog

struct ContentView: View {
    
    @ObservedObject var viewModel = InfiniteSearchViewModel()
    
    @State private var page = 1
    var searchString: String
    let logger = Logger()
    
    var body: some View {
        VStack {
            List(viewModel.response) { item in
                Text(item.title)
//                Image(<#T##name: String##String#>)
//                Text(item.owner)
//                Text(item.secret)
//                Text(item.title)
            }
        }
        .padding()
        
        .onAppear() {
            Task {
                try await viewModel.fetchPhotos(page: $page, query: searchString)
            }
        }
    }
}
