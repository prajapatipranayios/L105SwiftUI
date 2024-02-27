//
//  ContentView.swift
//  L105SwiftUI
//
//  Created by Auxano on 21/02/24.
//

import SwiftUI
import Charts

struct MoviesView: View {
    @EnvironmentObject var viewModel: MoviesViewModel
    
    var body: some View {
        TabView {
            List {
                Section(header: Text("Popular Movies")) {
                    ForEach(viewModel.movies) {
                        movie in
                        NavigationLink(destination: MovieDetailsView(movie: movie)) {
                            MovieCardView(movie: movie)
                        }
                    }
                }
            }
            .onAppear(perform: {
                viewModel.getMovies()
            })
            .tabItem {
                Label("Movies",
                systemImage: "popcorn.fill")
            }
            
            Chart {
                ForEach(viewModel.movieRatings.prefix(5)) {movie in
                    BarMark(x: .value("Vote Count", movie.voteCount),
                            y: .value("Movies", movie.title))
                }
            }
            .onAppear {
                viewModel.getMovieRatings()
            }
            .padding(10)
            .tabItem {
                Label("Ratings", 
                      systemImage: "chart.bar")
            }
        }
        .navigationTitle("Movies")
    }
}

#Preview {
    MoviesView()
        .environmentObject(MoviesViewModel())
}
