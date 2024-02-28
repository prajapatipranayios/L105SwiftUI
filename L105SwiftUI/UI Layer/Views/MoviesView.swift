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
//                ForEach(viewModel.movieRatings.prefix(15)) { movie in
////                    LineMark(x: .value("Movies", movie.title),
////                            y: .value("Vote Count",
////                                      movie.voteCount) )
////                    .foregroundStyle(Color.purple)
////                    .symbol(by: .value("Movie", movie.title))
////                    .accessibilityLabel(movie.title)
////                    .accessibilityValue("\(movie.voteCount) votes")
////                    .interpolationMethod(.catmullRom)
//
////                    BarMark(x: .value("Movies", movie.title),
////                            y: .value("Vote Average",
////                                      movie.voteAverage) )
//////                    .foregroundStyle(by: .value("Movie", movie.title))
////                    .foregroundStyle(Color.green)
////                    .symbol(by: .value("Movie", movie.title))
////                    .accessibilityLabel(movie.title)
////                    .accessibilityValue("\(movie.popularity)")
//
////                    BarMark(x: .value("Movies", movie.title),
////                            y: .value("Popularity",
////                                      movie.popularity) )
//////                    .foregroundStyle(by: .value("Movie", movie.title))
////                    .symbol(by: .value("Movie", movie.title))
////                    .accessibilityLabel(movie.title)
////                    .accessibilityValue("\(movie.popularity)")
////                    .interpolationMethod(.catmullRom)
//
//                    
////                    LineMark(
////                        x: .value("Movie",
////                                  movie.title),
////                        y: .value("Vote Average",
////                                  movie.voteAverage)    
////                    )
//
////                    AreaMark(
////                        x: .value("Movie",
////                                  movie.title),
////                        yStart: .value("Vote Min",
////                                       movie.minVote()),
////                        yEnd: .value("Vote Max",
////                                     movie.maxVote())
////                    )
////                    .opacity(0.3)
//                    
////                    RectangleMark(
////                        x: .value("Movie",
////                                  movie.title),
////                        y: .value("Vote Average",
////                                  movie.voteAverage),
////                        width: .ratio(0.6),
////                        height: 3
////                    )
////                    
////                    BarMark(
////                        x: .value("Movie",
////                                  movie.title),
////                        yStart: .value("Vote Min",
////                                       movie.minVote()),
////                        yEnd: .value("Vote Max",
////                                     movie.maxVote())
////                        ,
////                        width: .ratio(0.7)
////                    )
////                    .opacity(0.3)
//                }
                
                ForEach(viewModel.movieRatings.prefix(10)) { movie in
                    RectangleMark(
                        x: .value("Movie",
                                  movie.title),
                        y: .value("Vote Average",
                                  movie.voteAverage),
                        width: .ratio(0.6),
                        height: 3
                    )

                    BarMark(
                        x: .value("Movie",
                                  movie.title),
                        yStart: .value("Vote Min",
                                       movie.minVote()),
                        yEnd: .value("Vote Max",
                                     movie.maxVote())
                        ,
                        width: .ratio(0.7)
                    )
                    .opacity(0.3)
                }
                .foregroundStyle(.green.opacity(0.5))
                
                RuleMark(
                    y: .value("Average",
                              viewModel.getMovieRatingsVoteAverage())
                )
                .lineStyle(StrokeStyle(lineWidth: 2))
                .annotation(position: .top,
                            alignment: .leading) {
                    Text("Average:  \(viewModel.getMovieRatingsVoteAverage(), format: .number)")
                    .font(.headline)
                    .foregroundStyle(.red)
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
