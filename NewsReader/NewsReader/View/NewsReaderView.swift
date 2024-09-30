//
//  NewReaderView.swift
//  NewsReader
//
//  Created by Murali on 30/09/24.
//

import SwiftUI

struct NewsReaderView: View {
    
    @ObservedObject var newReaderViewModel = NewsReaderViewModel()
    @State  var showPopover: Bool = false
    @State  var filterOptions: [String] = [
        "Business",
        "politics",
        "Sports",
        "Entertainment"
    ]

    var body: some View {
       
        NavigationStack {
            
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                List {
                  
                    ForEach(newReaderViewModel.articles, id: \.title) { article in
                        NavigationLink {
                            DetailNewsReaderView(newsReaderViewModel: newReaderViewModel, article: article)
                        } label: {
                            CustomTableCell(article: article)
                            
                            Spacer()
                            
                            Button(action: {
                            }) {
                                Image(systemName: newReaderViewModel.isBookmarked(article: article) ? "bookmark.fill" : "bookmark")
                            }
                            .onTapGesture {
                                newReaderViewModel.toggleBookmark(for: article)
                            }

                        }
                    }
                }
            }
            .navigationTitle("News Reader")
            .navigationBarItems(
                leading:
                    NavigationLink(destination: BookMarkedView(viewModel: newReaderViewModel), label: {
                        Image(systemName: "bookmark.circle")
                    }),
                trailing:
                    filterButton
            )
            .onAppear {
                newReaderViewModel.fetchArticles(category: filterOptions[0]) {
                    
                }
            }
        }
        
    }

}

#Preview {
    NewsReaderView()
}
