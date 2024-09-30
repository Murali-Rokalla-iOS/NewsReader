//
//  CustomError.swift
//  NewsReader
//
//  Created by Murali on 30/09/24.
//

import Foundation

enum CustomError: LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidData
    case customError(error: Error)
    
    var errorDescription: String? {
        
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid Response"
        case .invalidData:
            return "Invalid Data"
        case .customError(let error):
            return error.localizedDescription
        }
    }
}
