//
//  BookMarkedView.swift
//  NewsReader
//
//  Created by Murali on 30/09/24.
//

import SwiftUI

struct BookMarkedView: View {
    
    @ObservedObject var viewModel: NewsReaderViewModel
    
    var body: some View {
        
        List {
          
            if viewModel.allBookmarkedArticles.count > 0 {
                
                ForEach(viewModel.allBookmarkedArticles, id: \.title) { article in
                    NavigationLink {
                        DetailNewsReaderView(newsReaderViewModel: viewModel, article: article)
                    } label: {
                        CustomTableCell(article: article)
                        
                        Spacer()
                        
                        Button(action: {
                        }) {
                            Image(systemName: viewModel.isBookmarked(article: article) ? "bookmark.fill" : "bookmark")
                        }
                        .onTapGesture {
                            viewModel.toggleBookmark(for: article)
                        }

                    }
                }
            }
            else {
                ContentUnavailableView("No Result Found", systemImage: "bookmark", description: Text("Please add the bookmark and try again."))

            }

        }
        .navigationTitle("Bookmarks")
    }
}
