//
//  LaunchDetailFetcher.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/06.
//

import Foundation
import Combine

class LaunchDetailFetcher: ObservableObject {
    
    let service: LaunchDetailAPIServiceProtocol
    
    init(service: LaunchDetailAPIServiceProtocol = APILaunchService(), launch: Launch) {
        self.service = service
        self.launchDetail = launch
    }
    
    @Published var launchDetail: Launch?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    func fetchLaunchDetail() {
        isLoading = true
        errorMessage = nil
        
        guard let launchDetail = launchDetail else {
            return
        }
        
        service.fetchLaunchDetail(id: launchDetail.id) { [unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print(error.localizedDescription)
                case .success(let launchDetail):
                    self.launchDetail = launchDetail
                    print(launchDetail)
                }
            }
        }
    }
    
}
