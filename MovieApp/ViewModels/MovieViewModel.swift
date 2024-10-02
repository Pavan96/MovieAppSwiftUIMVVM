//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Pavan More on 29/09/24.
//

import Foundation
import SwiftUI

class MovieListVieModel: ViewModelBase {
    
    @Published var movies = [MovieViewModel]()
    let apiService = MoviesAPIService(aHttpClient: HTTPClient())
    
    func searchByName(name: String) {
        
        if name.isEmpty {
            return
        }
        
        self.loadingState = .loading
        
        apiService.getMoviesBy(search: name.trimmedAndEscapped()) { result  in
            switch result {
            case .success(let movies):
                if let movies = movies {
                    DispatchQueue.main.async {
                        self.movies = movies.map(MovieViewModel.init)
                        self.loadingState = .success
                    }
                }
            case .failure( _):
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
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
