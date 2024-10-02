//
//  LodingView.swift
//  MovieApp
//
//  Created by Pavan More on 02/10/24.
//

import SwiftUI

struct LodingView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Text("Loading")
                .font(.system(size: 20).bold())
                .foregroundColor(.blue)
            ProgressView().progressViewStyle(.circular).tint(.blue)
                .scaleEffect(2.0)
        }
    }
}

struct LodingView_Previews: PreviewProvider {
    static var previews: some View {
        LodingView()
    }
}
