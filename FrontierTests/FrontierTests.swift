//
//  FrontierTests.swift
//  FrontierTests
//
//  Created by Songyee Park on 2022/06/22.
//

import XCTest
import Combine

@testable import Frontier

class FrontierTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        subscriptions = []
    }
    
    var subscriptions = Set<AnyCancellable>()
    
    func test_fetch_articles_success() {
        let success = Result<[Article], APIError>.success([Article.example(), Article.exampleTwo()])
        let fetcher = NewsArticleFetcher(service: APIMockService(result: success))
        let promise = expectation(description: "fetching articles")
        
        fetcher.$articles.sink { articles in
            if articles.count > 0 {
                promise.fulfill()
            }
        }
        .store(in: &subscriptions)
        wait(for: [promise], timeout: 2)
    }
    
    func test_fetch_articles_error() {
        let failure = Result<[Article], APIError>.failure(.badURL)
        let fetcher = NewsArticleFetcher(service: APIMockService(result: failure))
        let promise = expectation(description: "show error message")
        
        fetcher.$articles.sink { articles in
            if articles.count > 0 {
                XCTFail()
            }
        }
        .store(in: &subscriptions)
        
        fetcher.$errorMessage.sink { message in
            if message != nil {
                promise.fulfill()
            }
        }
        .store(in: &subscriptions)
        wait(for: [promise], timeout: 2)
    }

}
