//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Pavan More on 03/10/24.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movieDetailVM: MovieDetailViewModel
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                URLImage(url: movieDetailVM.poster)
                    .cornerRadius(10)
        
                
                Text(movieDetailVM.title).font(.title)
                Text("Director").fontWeight(.bold)
                Text(movieDetailVM.director)
                HStack {
                    Rating(rating: .constant(movieDetailVM.rating))
                    Text("\(movieDetailVM.rating)/10")
                }.padding(.top, 10)
                
                Spacer()
            }.padding()
            
            .navigationTitle(self.movieDetailVM.title)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let movieDetail = MovieDetail(title: "Bataman Begins", year: "1992", rated: "PG-13", plot: "After traainig with mentor, Btaman begin to fly high in the sky ", director: "Christopher Nolan", actors: "", imdbRating: "4.8", poster: "https://m.media-amazon.com/images/I/71Ag2Mr786L._SL1500_.jpg", imdbId: "34t5r")
        
        return MovieDetailView(movieDetailVM: MovieDetailViewModel(movieDetail: movieDetail))
            .embedNavigationView()
        
    }
}
