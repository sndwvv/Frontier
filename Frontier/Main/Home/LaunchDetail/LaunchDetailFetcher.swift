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
    
    init(service: LaunchDetailAPIServiceProtocol = LaunchAPIService(), launch: Launch) {
        self.service = service
        self.launchDetail = launch
        fetchLaunchDetail()
    }
    
    @Published var launchDetail: Launch?
    
    func fetchLaunchDetail() {
        guard let launchDetail = launchDetail else {
            return
        }
        service.fetchLaunchDetail(id: launchDetail.id) { [unowned self] result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error.description)
                    break
                case .success(let launchDetail):
                    self.launchDetail = launchDetail
                    print(launchDetail)
                }
            }
        }
    }
}
