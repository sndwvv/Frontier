//
//  LaunchFetcher.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/24.
//

import Foundation
import Combine

class LaunchFetcher: ObservableObject {
    
    @Published var launches: [Launch] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchLaunches()
    }
    
    private var cancellable: AnyCancellable?
    
    func fetchLaunches() {
        isLoading = true
        errorMessage = nil
                
        service.fetchUpcomingLaunches { [unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print(error.description)
                case .success(let launchResponse):
                    self.launches = launchResponse.results
                }
            }
        }
    }
    
    // MARK: Mocks
    
    func fetchMockLaunch() {
        isLoading = true
        errorMessage = nil
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.isLoading = false
            self.launches = [Launch.example()]
        }
    }
    
    func fetchMockError() {
        isLoading = true
        errorMessage = nil
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.isLoading = false
            self.errorMessage = APIError.badURL.localizedDescription
        }
    }
    
}
