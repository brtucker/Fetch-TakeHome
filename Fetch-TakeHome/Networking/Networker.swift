//
//  Networker.swift
//  Fetch-TakeHome
//
//  Created by Blake Tucker on 1/23/24.
//

import Foundation

enum NetworkError: Error {
    case badURL
}

class Networker {
    enum Path {
        case category(String)
        case detail(uuid: String)
        
        private var baseURL: URL? {
            return URL(string: "https://themealdb.com/api/json/v1/1/")
        }
        
        var url: URL? {
            switch self {
            case .category(let category):
                var categoryURL = baseURL?.appending(path: "filter.php")
                categoryURL?.append(queryItems: [URLQueryItem(name: "c", value: category)])
                return categoryURL
            case .detail(let uuid):
                var detailURL = baseURL?.appending(path: "lookup.php")
                detailURL?.append(queryItems: [URLQueryItem(name: "i", value: uuid)])
                return detailURL
            }
        }
    }
    
    func fetch(path: Path) async throws -> Result<Data, NetworkError> {
        guard let url = path.url else {
            return .failure(.badURL)
        }
        
        let request = URLRequest(url: url)
        let session = URLSession.shared
        
        let (data, response) = try await session.data(for: request)
        return .success(data)
    }
}
