//
//  CutomImgeView.swift
//  InfiniteSearch
//
//  Created by poonam.l.yadav on 24/03/2025.
//

import SwiftUI

struct CustomImageView : View {
    
    let imageURL: String
  
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { image in
            image
                .applyCustomModifier()

        } placeholder: {
            ProgressView {
                Image(systemName: "progress.indicator")
                    .applyCustomModifier()
            }
        }
    }
}


extension Image {
    func applyCustomModifier() -> some View {
        self.resizable().frame(width: 50.0, height: 50.0).aspectRatio(contentMode: .fit)
    }
}
