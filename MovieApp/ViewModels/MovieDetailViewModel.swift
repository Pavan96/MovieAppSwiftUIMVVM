//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Pavan More on 03/10/24.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    
    private var movieDetail: MovieDetail?
    @Published var loadingState = LoadingState.loading
    
    let apiService = MoviesAPIService(aHttpClient: HTTPClient())
    
    init(movieDetail: MovieDetail? = nil) {
        self.movieDetail = movieDetail
    }
    
    func getMovieDetailsByImbId(imbId: String) {
        
        apiService.getMovieByDetail(imdbId: imbId) { result in
                
            switch result {
                case .success(let movieDetail):
                    DispatchQueue.main.async {
                        self.movieDetail = movieDetail
                        self.loadingState = .success
                    }
                   
                case .failure( _):
                    DispatchQueue.main.async {
                        self.loadingState = .failed
                    }
            }
        }
    }
    
    var title: String {
        self.movieDetail?.title ?? ""
    }
    
    var year: String {
        self.movieDetail?.year ?? ""
    }
    
    var rating: Int {
        get {
            let ratingAsDouble = Double(self.movieDetail?.imdbRating ?? "0.0")
            return Int(ceil(ratingAsDouble ?? 0.0))
        }
    }
    
    var poster: String {
        self.movieDetail?.poster ?? ""
    }
    
    var actors: String {
        self.movieDetail?.actors ?? ""
    }
    
    var director: String {
        self.movieDetail?.director ?? ""
    }
    
}

