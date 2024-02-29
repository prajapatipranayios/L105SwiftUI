//
//  MoviesViewModel.swift
//  L105SwiftUI
//
//  Created by Auxano on 21/02/24.
//

import Foundation
import Combine
import Network
import CoreData

class MoviesViewModel: ObservableObject {
    private var networkConnectivity: NWPathMonitor = NWPathMonitor()
    
    // Core Data
    //@StateObject private var persistentController = MoviePersistentController()
    private var persistentController = MoviePersistentController()
    
    // Network/backend Service
    private let apiService: MovieAPILogic
//    private let apiService: MovieAPI
    
    @Published private(set) var movies: [Movie] = []
    @Published private(set) var error: DataError? = nil
    @Published private(set) var movieRatings: [MovieRating] = []
    
    init(apiService: MovieAPILogic = MovieAPI(),
         name: String = "") {
        self.apiService = apiService
        networkConnectivity.start(queue: DispatchQueue.global(qos: .userInitiated))
    }
//    init(apiService: MovieAPI = MovieAPI()) {
//        self.apiService = apiService
//    }
    
    func getMovies() {
        switch networkConnectivity.currentPath.status {
        case .satisfied:    //  Connected to internet
            //apiService.getMovies() { [weak self] result in
            apiService.getMovies { [weak self] result in
                switch result {
                case .success(let movies):
                    self?.movies = movies ?? []
                    self?.persistentController.addAndUpdateServerDataToCoreData(moviesFromBackend: movies)
                case .failure(let error):
                    self?.error = error
                }
            }
        default:    //  not connected to internet
            // fetch it from persistence of the device
            movies = persistentController.fetchMoviesFromCoreData()
        }
    }
    
    func getMovieRatingsVoteAverage() -> Double {
        let voteAverages = movieRatings.prefix(10).map { $0.voteAverage }
        let sum = voteAverages.reduce(0, +)
        return sum / 10
    }
    
    func getMovieRatings() {
        switch networkConnectivity.currentPath.status {
        case .satisfied:    //  Connected to internet
            apiService.getMovieRatings { result in
                switch result {
                case .success(let movieRatings):
                    self.movieRatings = movieRatings ?? []
                case .failure(let error):
                    self.error = error
                }
            }
        default:
            //  TODO: add core data fetch
            break
        }
    }
}
