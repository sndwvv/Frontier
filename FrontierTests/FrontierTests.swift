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
        let fetcher = NewsArticleFetcher(service: NewsAPIMockService(result: success))
        let promise = expectation(description: "test_fetch_articles_success")
        
        fetcher.service.fetchLatestNews { result in
            switch result {
            case .success(let articles):
                if articles.count > 0 {
                    promise.fulfill()
                } else {
                    XCTFail()
                }
            case .failure:
                XCTFail()
            }
        }
        wait(for: [promise], timeout: 2)
    }
    
    func test_fetch_articles_error() {
        let failure = Result<[Article], APIError>.failure(.badURL)
        let fetcher = NewsArticleFetcher(service: NewsAPIMockService(result: failure))
        let promise = expectation(description: "test_fetch_articles_error")
        
        fetcher.service.fetchLatestNews { result in
            switch result {
            case .success:
                XCTFail()
            case .failure:
                promise.fulfill()
            }
        }
        wait(for: [promise], timeout: 2)
    }
    
    func test_fetch_launch_list_success() {
        let launchList = LaunchSerializer(count: 1, next: nil, previous: nil, results: [Launch.localJSONExample()])
        let success = Result<LaunchSerializer, APIError>.success(launchList)
        let fetcher = HomeLaunchFetcher(service: LaunchListAPIMockService(result: success))
        let promise = expectation(description: "test_fetch_launch_list_success")
        
        fetcher.service.fetchUpcomingLaunches { result in
            switch result {
            case .failure:
                XCTFail()
            case .success(let launchList):
                if launchList.results.isEmpty {
                    XCTFail()
                } else {
                    promise.fulfill()
                }
            }
        }
        wait(for: [promise], timeout: 2)
    }
    
    func test_fetch_launch_list_error() {
        let failure = Result<LaunchSerializer, APIError>.failure(.noData)
        let fetcher = HomeLaunchFetcher(service: LaunchListAPIMockService(result: failure))
        let promise = expectation(description: "test_fetch_launch_list_error")
        
        fetcher.service.fetchUpcomingLaunches { result in
            switch result {
            case .failure:
                promise.fulfill()
            case .success:
                XCTFail()
            }
        }
        wait(for: [promise], timeout: 2)
    }

}
