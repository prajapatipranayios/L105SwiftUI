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
            }.padding()
            //Image(systemName: "person")
            Spacer()
            let url = URL(string: movie.getImageUrl())
            AsyncImage(url: url) { image in
                image.scaledToFit()
            } placeholder: {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        }.padding()
    }
}

#Preview {
    MovieCardView(movie: Movie(id: 1,
                               title: "Terminator 2",
                               releaseDate: "1997-10-01",
                               imageUrlSuffix: "/8uO0gUM8aNqYLs1OsTBQiXu0fEv.jpg",
                               overview: "Terminator T-100 and the rest of the crew fight for the future of humanity."))
}
