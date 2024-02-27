//
//  MovieDetailsView.swift
//  L105SwiftUI
//
//  Created by Auxano on 23/02/24.
//

import SwiftUI

struct MovieDetailsView: View {
    var movie: Movie
        
    var body: some View {
        ScrollView {
            VStack {
                //Text(movie.title)
                //Spacer()
                let url = URL(string: movie.getLargeImageUrl())
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .frame(width: 350, height: 350, alignment: .center)
                } placeholder: {
                    Image("default")
                        .resizable()
                        .frame(width: 250, height: 250)
                }
                Spacer()
                Text("Released: \(movie.releaseDate)")
                Spacer()
                Text(movie.overview)
                    .font(.body)                    
                    .foregroundStyle(.black)
            }
            //s.accessibilityLabel("Moovie Details")
            //.accessibilityAddTraits(.)
        }
        .navigationTitle(movie.title)
        .foregroundColor(.blue)
        .padding()
    }
}

#Preview {
    MovieDetailsView(movie: Movie(id: 1,
                                  title: "Terminator 2",
                                  releaseDate: "1997-10-01",
                                  imageUrlSuffix: "/8uO0gUM8aNqYLs1OsTBQiXu0fEv.jpg",
                                  overview: "Terminator T-100 and the rest of the crew fight for the future of humanity."))
}
