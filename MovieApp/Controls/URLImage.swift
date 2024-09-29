//
//  URLImage.swift
//  MovieApp
//
//  Created by Pavan More on 28/09/24.
//

import SwiftUI

struct URLImage: View {
    
    let url: String
    let placeholder: String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String, placehodler: String = "placeholder"){
        self.url = url
        self.placeholder = placehodler
        self.imageLoader.downloadImage(url: self.url)
    }
    
    var body: some View {
        
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data)!).resizable()
        } else {
            return Image("").resizable()
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "https://fastly.picsum.photos/id/28/4928/3264.jpg?hmac=GnYF-RnBUg44PFfU5pcw_Qs0ReOyStdnZ8MtQWJqTfA")
    }
}
