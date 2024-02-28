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
                ForEach(viewModel.movieRatings.prefix(15)) {movie in
                    LineMark(x: .value("Movies", movie.title),
                             y: .value("Vote Count", movie.voteCount))
                    .foregroundStyle(Color.red)
                    //.foregroundStyle(by: .value("Movie", movie.title))
                    //.symbol(by: .value("Movie", movie.title))
                    //.accessibilityLabel(movie.title)
                    //.interpolationMethod(.catmullRom)
                    
                    BarMark(x: .value("Movies", movie.title),
                            y: .value("Vote Count", movie.voteAverage))
                    .foregroundStyle(Color.red)
                    .symbol(by: .value("Movie", movie.title))
                    .accessibilityLabel(movie.title)
                    .accessibilityValue("\(movie.popularity)")
                    
                    BarMark(x: .value("Movies", movie.title),
                            y: .value("Vote Average", movie.voteCount))
                    .foregroundStyle(Color.red)
                    .symbol(by: .value("Movie", movie.title))
                    .accessibilityLabel(movie.title)
                    .accessibilityValue("\(movie.popularity)")
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
