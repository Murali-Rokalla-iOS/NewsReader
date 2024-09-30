//
//  NewsReaderTests.swift
//  NewsReaderTests
//
//  Created by Murali on 30/09/24.
//

import XCTest
@testable import NewsReader

final class NewsReaderTests: XCTestCase {

    var viewModel: NewsReaderViewModel!
//    var mockService: MockNewsService!
//
//    override func setUp() {
//        super.setUp()
//        mockService = MockNewsService()
//        viewModel = NewsReaderViewModel(newsService: mockService)
//    }

}

/*
 
 import XCTest
 @testable import YourApp // Replace with your app's name

 class NetworkServiceTests: XCTestCase {
     var networkService: NetworkService!

     override func setUp() {
         super.setUp()
         networkService = NetworkService()
     }

     override func tearDown() {
         networkService = nil
         super.tearDown()
     }

     func testFetchArticlesSuccess() {
         let expectation = XCTestExpectation(description: "Fetch articles successfully")

         networkService.fetchArticles(category: "general") { result in
             switch result {
             case .success(let articles):
                 XCTAssertFalse(articles.isEmpty, "Articles should not be empty")
                 expectation.fulfill()
             case .failure(let error):
                 XCTFail("Expected success, but got error: \(error)")
             }
         }

         wait(for: [expectation], timeout: 10.0)
     }

     func testFetchArticlesFailure() {
         let expectation = XCTestExpectation(description: "Fetch articles with invalid category fails")

         networkService.fetchArticles(category: "invalid_category") { result in
             switch result {
             case .success:
                 XCTFail("Expected failure, but got success")
             case .failure(let error):
                 XCTAssertNotNil(error, "Expected an error, but got none")
                 expectation.fulfill()
             }
         }

         wait(for: [expectation], timeout: 10.0)
     }
 }

 
 */
