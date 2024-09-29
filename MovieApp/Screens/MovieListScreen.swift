//
//  MovieListScreen.swift
//  MovieApp
//
//  Created by Pavan More on 29/09/24.
//

import SwiftUI

struct MovieListScreen: View {
    
    @ObservedObject private var movieListVM: MovieListVieModel
    
    init() {
        self.movieListVM = MovieListVieModel()
        self.movieListVM.searchByName(name: "batman")
    }
    
    var body: some View {
        VStack {
            MovieListView(movies: self.movieListVM.movies)
                .navigationTitle("Movies")
        }.embedNavigationView()
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
