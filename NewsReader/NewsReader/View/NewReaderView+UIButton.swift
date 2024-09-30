//
//  NewReader.swift
//  NewsReader
//
//  Created by Murali on 30/09/24.
//

import Foundation
import SwiftUI

extension NewsReaderView {
    
    var filterButton: some View {
        Button {
            showPopover.toggle()

        } label: {
            Image(systemName: "line.3.horizontal.decrease.circle")
        }
        .popover(isPresented: $showPopover, attachmentAnchor: .point(.top), content: {
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 20, content: {
                    
                    ForEach(filterOptions, id: \.self) { option in
                        
                        Button("\(option)") {
                            showPopover.toggle()

                            newReaderViewModel.fetchArticles(category: "\(option)") {
                                
                            }

                        }
                        
                        if option != filterOptions.last {
                            Divider()
                        }
                    }
                })
                .padding(20)

            }
            .presentationCompactAdaptation(.popover)
            
        })
    }
}
