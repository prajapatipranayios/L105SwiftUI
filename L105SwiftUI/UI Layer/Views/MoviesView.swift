//
//  ContentView.swift
//  L105SwiftUI
//
//  Created by Auxano on 21/02/24.
//

import SwiftUI

struct MoviesView: View {
    @EnvironmentObject var viewModel: MoviesViewModel
    
    var body: some View {
        List {
            Section(header: Text("Popular Movies")) {
                ForEach(viewModel.movies) {
                    movie in
                    NavigationLink(destination: MovieDetailsView(movie: movie)) {
                        MovieCardView(movie: movie)
                    }
                    //NavigationLink(destination: Text(movie.title)) {
                      //  MovieCardView(movie: movie)
                    //}
                }
            }
        }
        .navigationTitle("Movies")
        .onAppear(perform: {
            viewModel.getMovies()
        })
    }
}

#Preview {
    MoviesView()
        .environmentObject(MoviesViewModel())
}