//
//  ViewModelBase.swift
//  MovieApp
//
//  Created by Pavan More on 02/10/24.
//

import Foundation
import SwiftUI

enum LoadingState {
    case none, loading, success, failed
}

class ViewModelBase: ObservableObject {
    
    @Published var loadingState: LoadingState = .none
}
