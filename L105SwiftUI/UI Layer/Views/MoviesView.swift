//
//  ContentView.swift
//  L105SwiftUI
//
//  Created by Auxano on 21/02/24.
//

import SwiftUI
import Charts
import CoreData

struct MoviesView: View {
    @Environment(\.managedObjectContext) var managedObjectContext: NSManagedObjectContext
    @EnvironmentObject var viewModel: MoviesViewModel
    
    @FetchRequest(sortDescriptors: []) var movieCDList: FetchedResults<MovieCD>
    
    var body: some View {
        TabView {
            List {
                Section(header: Text("Popular Movies")) {
                    //ForEach(viewModel.movies) { movie in
                    ForEach(movieCDList) { movieCD in
                        let movie = Movie(id: Int(movieCD.id),
                                          title: movieCD.title ?? "",
                                          releaseDate: movieCD.releaseDate ?? "",
                                          imageUrlSuffix: movieCD.imageUrlSuffix ?? "",
                                          overview: movieCD.overview ?? "")
                        NavigationLink(destination: MovieDetailsView(movie: movie)) {
                            MovieCardView(movie: movie)
                        }
                    }
                }
            }
            .onAppear(perform: {
                viewModel.getMovies()
            })
            .onTapGesture {
                if let movie = viewModel.movies.first {
                    let movieCD = MovieCD(context: managedObjectContext)
                    movieCD.id = Int64(movie.id)
                    movieCD.title = movie.title
                    movieCD.largeImageUrl = movie.getLargeImageUrl()
                    movieCD.thumbnailImageUrl = movie.getThumbnailImageUrl()
                    movieCD.overview = movie.overview
                    movieCD.imageUrlSuffix = movie.imageUrlSuffix
                    movieCD.releaseDate = movie.releaseDate
                    try? managedObjectContext.save()
                }
            }
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
