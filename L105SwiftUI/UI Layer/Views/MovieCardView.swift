//
//  MovieCardView.swift
//  L105SwiftUI
//
//  Created by Auxano on 21/02/24.
//

import SwiftUI

struct MovieCardView: View {
    var movie: Movie
    
    var body: some View {
        HStack {
            VStack {
                Text(movie.title)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                Text(movie.releaseDate)
            }
            Image(systemName: "person")
            AsyncImage(url: <#T##URL?#>)
        }
    }
}

#Preview {
    MovieCardView(movie: Movie(id: 1,
                               title: "Terminator 2",
                               releaseDate: "1997-10-01",
                               imageUrlSuffix: "/8uO0gUM8aNqYLs1OsTBQiXu0fEv.jpg",
                               overview: "Terminator T-100 and tthe restt of the crew fight for the future of humanity."))
}
