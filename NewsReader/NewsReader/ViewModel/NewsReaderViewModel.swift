//
//  NewsReaderViewModel.swift
//  NewsReader
//
//  Created by Murali on 30/09/24.
//

import Foundation

class NewsReaderViewModel: ObservableObject {
    
    private let newReaderDelegate: NewsReaderDelegate
    @Published var articles: [Article] = []
    @Published var customError: CustomError?
    @Published var bookmarks: Set<String> = []
    
    init(newReaderDelegate: NewsReaderDelegate = NetworkManager()) {
        self.newReaderDelegate = newReaderDelegate
    }
    
    func fetchArticles(category: String, completion: @escaping () -> Void) {
        
        newReaderDelegate.fetchArticles(category: category) { result in
            switch result {
            case .success(let response):
                
                DispatchQueue.main.async {
                    self.articles = response.articles
                }
            case .failure(let error):
                self.customError = CustomError.customError(error: error)
            }
            completion()
        }
    }
    
    func toggleBookmark(for article: Article) {
        
        if bookmarks.contains(article.title) {
            bookmarks.remove(article.title)
        } else {
            bookmarks.insert(article.title)
        }
    }
    
    func isBookmarked(article: Article) -> Bool {
        bookmarks.contains(article.title)
    }
    
    var allBookmarkedArticles: [Article] {
        return articles.filter { bookmarks.contains($0.title) }
    }
}

