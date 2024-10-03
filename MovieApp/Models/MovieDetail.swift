//
//  MovieDetail.swift
//  MovieApp
//
//  Created by Pavan More on 03/10/24.
//

import Foundation

struct MovieDetail: Decodable {
    
    let title: String
    let year: String
    let rated: String
    let plot: String
    let director: String
    let actors: String
    let imdbRating: String
    let poster: String
    let imdbId: String

    
    private enum codingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case plot = "Plot"
        case director = "Director"
        case actors = "Actors"
        case imdbRating = "imdbRating"
        case poster = "Poster"
        case imdbId = "imdbID"
    }
}
