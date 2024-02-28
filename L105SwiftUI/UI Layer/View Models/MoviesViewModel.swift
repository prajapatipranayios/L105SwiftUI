//
//  MoviesViewModel.swift
//  L105SwiftUI
//
//  Created by Auxano on 21/02/24.
//

import Foundation
import Combine

class MoviesViewModel: ObservableObject {
    @Published private(set) var movies: [Movie] = []
    @Published private(set) var error: DataError? = nil
    @Published private(set) var movieRatings: [MovieRating] = []
    
    private let apiService: MovieAPILogic
//    private let apiService: MovieAPI
    
    init(apiService: MovieAPILogic = MovieAPI(),
         name: String = "") {
        self.apiService = apiService
    }
//    init(apiService: MovieAPI = MovieAPI()) {
//        self.apiService = apiService
//    }
    
    func getMovies() {
        //apiService.getMovies() { [weak self] result in
        apiService.getMovies { result in
            switch result {
            case .success(let movies):
                self.movies = movies ?? []
            case .failure(let error):
                self.error = error
            }
        }
    }
    
    func getMovieRatingsVoteAverage() -> Double {
        let voteAverages = movieRatings.prefix(10).map { $0.voteAverage }
        let sum = voteAverages.reduce(0, +)
        return sum / 10
    }
    
    func getMovieRatings() {
        apiService.getMovieRatings { result in
            switch result {
            case .success(let movieRatings):
                self.movieRatings = movieRatings ?? []
            case .failure(let error):
                self.error = error
            }
        }
    }
}
