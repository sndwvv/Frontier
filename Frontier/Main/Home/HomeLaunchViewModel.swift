//
//  HomeLaunchViewModel.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/24.
//

import Foundation
import Combine

class HomeLaunchViewModel: ObservableObject {
    
    let service: LaunchListAPIServiceProtocol
    
    init(service: LaunchListAPIServiceProtocol = APILaunchService()) {
        self.service = service
        load()
    }
    
    // MARK: Test
    
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
                case .success(let launchResponse):
                    if launchResponse.results.isEmpty {
                        self.state = .empty
                    } else {
                        if let firstLaunch = launchResponse.results.first {
                            let launchList = Array(launchResponse.results.dropFirst())
                            self.state = .loaded(firstLaunch, launchList)
                        }
                    }
                }
            }
        }
    }
    
}
