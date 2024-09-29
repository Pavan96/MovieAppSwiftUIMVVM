//
//  HTTPClient.swift
//  MovieApp
//
//  Created by Pavan More on 28/09/24.
//

import Foundation

class HTTPClient {
    
    func makeRequest<T: Codable>(aUrl: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        guard let aURL = URL(string: aUrl) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let request = URLRequest(url: aURL)

        URLSession(configuration: .default).dataTask(with: request) { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.invalidResponseStatus))
                return
            }
            
            guard  error == nil  else {
                completion(.failure(.dataTaskError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.corruptData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
            } catch {
                completion(.failure(.decodingError))
                return
            }
            
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponseStatus
    case dataTaskError
    case corruptData
    case decodingError
}
