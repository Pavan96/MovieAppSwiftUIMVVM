//
//  MovieListView.swift
//  MovieApp
//
//  Created by Pavan More on 29/09/24.
//

import SwiftUI

struct MovieListView: View {
    let movies: [MovieViewModel]
    
    var body: some View {
        List(self.movies, id: \.imdbId) { movie in
            MovieCell(movie: movie)
        }.contentShape(Rectangle())
        .listStyle(.plain)
    }
}

struct MovieCell: View {
    let movie: MovieViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            URLImage(url: movie.poster)
                .frame(width: 100, height: 120)
                .cornerRadius(6)
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                
                Text(movie.year)
                    .opacity(0.5)
                    .padding(.top, 10)
            }
        }.padding(5)
    }
}
