//
//  NetworkManager.swift
//  NewsReader
//
//  Created by Murali on 30/09/24.
//

import Foundation

protocol NewsReaderDelegate {
    func fetchArticles(category: String, completion: @escaping (Result<ResponseData, CustomError>) -> Void)
}

class NetworkManager: NewsReaderDelegate {
    
    func fetchArticles(category: String, completion: @escaping (Result<ResponseData, CustomError>) -> Void) {

        guard let url = URL(string: "\(AppConstants().baseURL)?category=\(category)&apiKey=\(AppConstants().apiKey)") else {
            completion(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let err = error {
                completion(.failure(.customError(error: err)))
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do {
                let decodeResponse = try JSONDecoder().decode(ResponseData.self, from: data)
                completion(.success(decodeResponse))
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

