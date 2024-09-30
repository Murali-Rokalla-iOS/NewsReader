//
//  NewsReaderModelViewTest.swift
//  NewsReaderTests
//
//  Created by Murali on 30/09/24.
//

import XCTest
@testable import NewsReader

class NewsReaderViewModelTests: XCTestCase {
    
    var viewModel: NewsReaderViewModel!
    var mockNewsReaderDelegate: MockNewsReaderDelegate!
    
    override func setUp() {
        super.setUp()
        mockNewsReaderDelegate = MockNewsReaderDelegate()
        viewModel = NewsReaderViewModel(newReaderDelegate: mockNewsReaderDelegate)
    }
    
    override func tearDown() {
        viewModel = nil
        mockNewsReaderDelegate = nil
        super.tearDown()
    }
    
    func testFetchArticlesSuccess() {

        let mockArticles = [MockData.article_Data, MockData.article_Data]
        
        let expectation = self.expectation(description: "Fetch articles should succeed")
        let responsedata = ResponseData(status: "ok", totalResults: mockArticles.count, articles: mockArticles)
        mockNewsReaderDelegate.mockResponse = .success(responsedata)
        viewModel.fetchArticles(category: "business") {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                XCTAssertEqual(self.viewModel.articles.count, 2)
                XCTAssertNil(self.viewModel.customError)
                XCTAssertEqual(self.viewModel.articles[0].title, "Titan sub: How trip to Titanic turned from smiles to tragedy - BBC.com")
                XCTAssertEqual(self.viewModel.articles[1].title, "Titan sub: How trip to Titanic turned from smiles to tragedy - BBC.com")
                expectation.fulfill()
            }


        }
        waitForExpectations(timeout: 1, handler: nil)

    }
    
    func testFetchArticlesFailure() {
        let expectation = self.expectation(description: "Fetch articles should fail")
        
        // Mock an error response
        mockNewsReaderDelegate.mockResponse = .failure(.customError(error: NSError(domain: "Test", code: 0, userInfo: nil)))
        
        viewModel.fetchArticles(category: "business") {
            XCTAssertTrue(self.viewModel.customError != nil)
            XCTAssertTrue(self.viewModel.articles.isEmpty)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testToggleBookmark() {
        let article = MockData.article_Data
        
        viewModel.toggleBookmark(for: article)
        XCTAssertTrue(viewModel.isBookmarked(article: article))
        
        viewModel.toggleBookmark(for: article)
        XCTAssertFalse(viewModel.isBookmarked(article: article))
    }
    
    // Test retrieving all bookmarked articles
    func testAllBookmarkedArticles() {
        let article1 = MockData.article_Data
        
        // Bookmark article1
        viewModel.toggleBookmark(for: MockData.article_Data)
        
        viewModel.articles = MockData.articleData
        let bookmarkedArticles = viewModel.allBookmarkedArticles
        
        XCTAssertEqual(bookmarkedArticles.count, 3)
        XCTAssertTrue(bookmarkedArticles.contains(where: { $0.title == article1.title }))

    }
}

class MockNewsReaderDelegate: NewsReaderDelegate {
    
    var mockResponse: Result<ResponseData, CustomError>?
    
    func fetchArticles(category: String, completion: @escaping (Result<ResponseData, CustomError>) -> Void) {
        if let response = mockResponse {
            completion(response)
        }
    }
}
