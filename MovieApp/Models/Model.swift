//
//  Model.swift
//  MovieApp
//
//  Created by Pavan More on 29/09/24.
//

import Foundation

struct MovieResponse: Codable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}

struct Movie: Codable {
    let title: String
    let year: String
    let imdbId: String
    let poster: String
    
    private enum CodingKeys:String, CodingKey {
        case title = "Title"
        case year  = "Year"
        case imdbId = "imdbID"
        case poster = "Poster"
    }
}
