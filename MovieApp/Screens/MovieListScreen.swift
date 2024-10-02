//
//  MovieListScreen.swift
//  MovieApp
//
//  Created by Pavan More on 29/09/24.
//

import SwiftUI

struct MovieListScreen: View {
    
    @ObservedObject private var movieListVM: MovieListVieModel
    @State private var movieName: String = ""
    
    init() {
        self.movieListVM = MovieListVieModel()
    }
    
    var body: some View {
        VStack {
            TextField("Search", text: $movieName, onEditingChanged:{ _ in}, onCommit: {
                    self.movieListVM.searchByName(name: movieName)
                }).textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
            .navigationTitle("Movies")

            if (self.movieListVM.loadingState == .loading) {
                LodingView()
            } else if (self.movieListVM.loadingState == .success) {
                MovieListView(movies: self.movieListVM.movies)
            } else if(self.movieListVM.loadingState == .failed) {
                FailedView()
            }
            
        }.padding()
         .embedNavigationView()
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
