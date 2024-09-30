//
//  CustomTableCell.swift
//  NewsReader
//
//  Created by Murali on 30/09/24.
//

import SwiftUI

struct CustomTableCell: View {
    
    let article: Article
    
    var body: some View {
        
        HStack {
            
            AsyncImage(url: URL(string: article.urlToImage ?? "")) { image in
                
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 70)
                Spacer()

            }
            placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                
                Text("\(article.title)")
                    .font(.headline)
                
                Text("\(article.description ?? "")")
                    .font(.subheadline)
                    .frame(height: 100)

            }
            Spacer()
        }
    }
}

#Preview {
    CustomTableCell(article: MockData.article_Data)
}
