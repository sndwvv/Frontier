//
//  ImageLoader.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import Foundation
import UIKit

class ImageLoader: ObservableObject {
    
    let url: String?

    init(url: String?) {
        self.url = url
    }
    
    enum State {
        case loading
        case error(String)
        case loaded(UIImage)
    }
    
    @Published var state: State = .loading
    
    func load() {
        guard let url = url, let fetchURL = URL(string: url) else {
            self.state = .error(APIError.badURL.localizedDescription)
            return
        }
        let request = URLRequest(url: fetchURL, cachePolicy: .returnCacheDataElseLoad)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if let error = error {
                    self.state = .error(error.localizedDescription)
                } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                    self.state = .error(APIError.badResponse(statusCode: response.statusCode).localizedDescription)
                } else if let data = data, let image = UIImage(data: data) {
                    self.state = .loaded(image)
                } else {
                    self.state = .error(APIError.unknown.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
}
