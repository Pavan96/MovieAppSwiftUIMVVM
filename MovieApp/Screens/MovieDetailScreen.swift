//
//  MovieDetailScreen.swift
//  MovieApp
//
//  Created by Pavan More on 03/10/24.
//

import SwiftUI

struct MovieDetailScreen: View {
    
    let imdbId: String
    @ObservedObject var movieDetailVM = MovieDetailViewModel()
    
    var body: some View {

        VStack {
            
            if movieDetailVM.loadingState == .loading {
                LodingView()
            } else if movieDetailVM.loadingState == .success {
                
            } else if movieDetailVM.loadingState == .failed {
                FailedView()
            }
            
        }.onAppear {
            
        }
    }
}

struct MovieDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailScreen()
    }
}
