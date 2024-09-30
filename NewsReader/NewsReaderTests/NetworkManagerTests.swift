//
//  NetworkManagerTests.swift
//  NewsReaderTests
//
//  Created by Murali on 30/09/24.
//

import XCTest
@testable import NewsReader

final class NetworkManagerTests: XCTestCase {

    var networkManager: NetworkManager!

    override func setUp() {
        super.setUp()
        networkManager = NetworkManager()
    }

    override func tearDown() {
        networkManager = nil
        super.tearDown()
    }

    func testFetchArticlesSuccess() {
        
        let expectation = self.expectation(description: "Fetch articles should succeed")
        
        networkManager.fetchArticles(category: "business") { result in
            switch result {
            case .success(let responseData):
                XCTAssertNotNil(responseData)
            case .failure:
                XCTFail("Expected success, but got failure")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    // Test for invalid URL
    func testFetchArticlesInvalidURL() {
        let expectation = self.expectation(description: "Fetch articles should fail with invalid URL")
        
        networkManager.fetchArticles(category: "") { result in
            switch result {
            case .success:
                XCTFail("Expected failure, but got success")
            case .failure(let error):
                XCTAssertNotNil(error, "Expected an error, but got none")

            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }

}

