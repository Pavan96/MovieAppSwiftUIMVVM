//
//  FailedView.swift
//  MovieApp
//
//  Created by Pavan More on 02/10/24.
//

import SwiftUI

struct FailedView: View {
    
    @State private var enlarge = false
    
    var body: some View {
        VStack {
            Image("image-oops")
                .cornerRadius(20)
                .scaleEffect(CGSize(width: 0.5, height: 0.5))

        }   .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.gray)
            
    }
}

struct FailedView_Previews: PreviewProvider {
    static var previews: some View {
        FailedView()
    }
}
