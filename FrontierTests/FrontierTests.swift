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
        let promise = expectation(description: "Expected to PASS TEST: NewsArticleFetcher returns multiple Article objects.")
        
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
        let promise = expectation(description: "Expected to FAIL TEST: NewsArticleFetcher returns an APIError.")
        
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
        let promise = expectation(description: "Expected to PASS TEST: HomeLaunchFetcher returns multiple Launch objects.")
        
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
        let promise = expectation(description: "Expected to FAIL TEST: HomeLaunchFetcher returns an APIError.")
        
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
    
    func test_launch_countdown_service_success() {
        let launchDate = "2032-01-30T09:50:00Z"
        let service = LaunchCountDownService(launchDate: launchDate)
        let promise = expectation(description: "Expected to PASS TEST: LaunchCountDownService returns a Timer object.")
        
        service.setTimer()
        _ = service.createCountDown(launchDate: launchDate)
        
        service.$timer.sink { timer in
            if timer == nil {
                XCTFail()
            } else {
                promise.fulfill()
            }
        }
        .store(in: &subscriptions)
        wait(for: [promise], timeout: 2)
    }
    
    func test_launch_countdown_service_date_passed_error() {
        let launchDate = "2011-01-30T09:50:00Z"
        let service = LaunchCountDownService(launchDate: launchDate)
        let promise = expectation(description: "Expected to FAIL TEST: LaunchCountDownService timer is NIL.")
        
        service.setTimer()
        _ = service.createCountDown(launchDate: launchDate)
        
        service.$timer.sink { timer in
            if timer == nil {
                promise.fulfill()
            } else {
                XCTFail()
            }
        }
        .store(in: &subscriptions)
        wait(for: [promise], timeout: 2)
    }
    
    func test_launch_countdown_service_bad_date_error() {
        let launchDate = "2011/01/30"
        let service = LaunchCountDownService(launchDate: launchDate)
        let promise = expectation(description: "Expected to FAIL TEST: LaunchCountDownService timer is NIL.")
        
        service.setTimer()
        _ = service.createCountDown(launchDate: launchDate)
        
        service.$timer.sink { timer in
            if timer == nil {
                promise.fulfill()
            } else {
                XCTFail()
            }
        }
        .store(in: &subscriptions)
        wait(for: [promise], timeout: 2)
    }

}
