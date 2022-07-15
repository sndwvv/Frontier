//
//  JSONReader.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/15.
//

import Foundation

struct JSONReader {
    func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }
    
    func parseLocalJSON<T: Decodable>(fileName: String, _ type: T.Type) -> T? {
        guard let jsonData = readLocalFile(forName: fileName) else {
            return nil
        }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(type, from: jsonData)
            return decodedData
        } catch {
            return nil
        }
    }
    
}
