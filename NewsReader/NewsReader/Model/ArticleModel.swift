//
//  ArticleModel.swift
//  NewsReader
//
//  Created by Murali on 30/09/24.
//

import Foundation

// MARK: - ResponseData
struct ResponseData: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    //let publishedAt: Date
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}



struct MockData {
    
    static let articleData = [article_Data, article_Data, article_Data]
    
    static let article_Data = Article(source: Source(id: "", name: "BBC News"), author: "", title: "Titan sub: How trip to Titanic turned from smiles to tragedy - BBC.com", description: "A damning picture emerges from a public hearing into the failure of Oceangate’s Titan submersible.", url: "https://www.bbc.com/news/articles/ckgn39epv85o", urlToImage: "https://ichef.bbci.co.uk/news/1024/branded_news/d9ed/live/bb73f5c0-7cf7-11ef-bf1f-391a102b3481.jpg", content: "The view from inside Titan at the surface of a previous Titanic dive\r\n\"I saw five people smiling, looking forward to their journey.\"\r\nThat was Renata Rojas' recollection of her time on a support ship… [+8255 chars]")
}


