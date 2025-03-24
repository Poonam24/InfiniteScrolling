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
    
    
    var body: some View {

        List{
            ForEach(viewModel.response, id: \.self) { item in
                        HStack (spacing: 10.0) {
                            CustomImageView(imageURL: item.url_s)
                            Text(item.title)
                        }
                }

                ProgressView("Loading More")
                    .progressViewStyle(.circular)
                    .opacity(1.0)
                    .frame(width: 300, height: 50.0)
                    .onAppear() {
                        Task {
                            page = page + 1
                            try await viewModel.fetchNextSetOfData(page + 1, searchString)
                        }
                    }
                    
            }
        .listStyle(.grouped)
        
            .onAppear() {
                Task {
                 //   try await viewModel.fetchPhotos(page, searchString)
                }
            }
    }
}


#Preview {
    ContentView(viewModel: InfiniteSearchViewModel(), searchString: "dogs")
}
