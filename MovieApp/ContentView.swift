//
//  ContentView.swift
//  MovieApp
//
//  Created by Pavan More on 28/09/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            // We will remove code after testing
                .onAppear{
                    MoviesAPIService(aHttpClient: HTTPClient()).getMoviesBy(search: "batman") { result in
                        
                        switch result {
                        case .success(let  movies):
                            print(movies)
                            
                        case .failure(let error):
                            print(error)
                        }
                    }
                }
        }
        .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
