//
//  HTTPClient.swift
//  MovieApp
//
//  Created by Pavan More on 28/09/24.
//

import Foundation

class HTTPClient {
    
    func makeRequest<T: Codable>(aUrl: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        let request = URLRequest(url: aUrl)
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
                completion(.success(result))
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

// Movies API Service

class MoviesAPIService {
    let httpClient: HTTPClient
    init(aHttpClient: HTTPClient) {
        self.httpClient = aHttpClient
    }
    
    func getMoviesBy(search: String, completion: @escaping (Result<[Movie]?, NetworkError>) -> Void) {
        guard let url = URL.forMoviesByName(search) else {
            return completion(.failure(.invalidURL))
        }
        
        httpClient.makeRequest(aUrl: url) { (result: Result<MovieResponse, NetworkError>) in
            switch result {
                case .success(let movieResponse):
                print(movieResponse)
                completion(.success(movieResponse.movies))
                
               case .failure(let error):
                print(error)
                completion(.failure(error))
            }
        }
    }
}





