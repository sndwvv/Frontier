//
//  HomeViewModel.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    let service: LaunchListAPIServiceProtocol
    
    init(service: LaunchListAPIServiceProtocol = LaunchAPIService()) {
        self.service = service
        load()

    }
    
    enum State {
        case loading
        case loaded(Launch, [Launch])
        case empty
        case error(String)
    }
    
    @Published var state: State = .loading
    
    func load() {
        service.fetchUpcomingLaunches { [unowned self] result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    self.state = .error(error.localizedDescription)
                case .success(let response):
                    if let firstLaunch = response.results.first {
                        let launchList = Array(response.results.dropFirst())
                        self.state = .loaded(firstLaunch, launchList)
                    } else {
                        self.state = .empty
                    }
                }
            }
        }
    }
    
}
