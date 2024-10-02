//
//  String+Extensions.swift
//  MovieApp
//
//  Created by Pavan More on 02/10/24.
//

import Foundation

extension String {
    
    func trimmedAndEscapped() -> String {
        
        let trimmingCharacters = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmingCharacters.addingPercentEncoding(withAllowedCharacters:  .urlHostAllowed) ?? self
    }
}
