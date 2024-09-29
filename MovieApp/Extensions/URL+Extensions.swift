//
//  URL+Extensions.swift
//  MovieApp
//
//  Created by Pavan More on 29/09/24.
//

import Foundation

extension URL {
    
    static func forMoviesByName(_ name: String) -> URL? {
        return  URL(string: "http://www.omdbapi.com/?s=\(name)&apikey=\(Constants.API_KEY)")
    }
}
