//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Pavan More on 29/09/24.
//

import Foundation
import SwiftUI

class MovieListVieModel: ObservableObject {
    
    @Published var movies = [MovieViewModel]()
    let apiService = MoviesAPIService(aHttpClient: HTTPClient())
    
    func searchByName(name: String) {
        apiService.getMoviesBy(search: name) { result  in
            switch result {
            case .success(let movies):
                if let movies = movies {
                    DispatchQueue.main.async {
                        self.movies = movies.map(MovieViewModel.init)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct MovieViewModel {
    
    let movie: Movie
    
    var imdbId: String {
        movie.imdbId
    }
    
    var title: String {
        movie.title
    }
    
    var poster: String {
        movie.poster
    }
    
    var year: String {
        movie.year
    }
}
