//
//  DetailNewsReaderView.swift
//  NewsReader
//
//  Created by Murali on 30/09/24.
//

import SwiftUI

struct DetailNewsReaderView: View {
    
    @ObservedObject var newsReaderViewModel: NewsReaderViewModel
    let article: Article

    var body: some View {
        
        ScrollView {
            
            VStack() {
                
                if let urlToImage = article.urlToImage, let url = URL(string: urlToImage) {
                    
                    AsyncImage(url: url) { image in
                        
                        image
                            .resizable()
                            .scaledToFit()
                        
                    } placeholder: {
                        ProgressView()
                    }
                }
               
                Text(article.title)
                    .font(.title)
                    .padding()
                if let description = article.description {
                    Text(description)
                        .font(.subheadline)
                        .padding()
                }
                              
                
                if let url = URL(string: article.url) {
                    Link("Read More", destination: url)
                        .padding()
                }

            }

        }
        .navigationTitle("Details")
    }
}



