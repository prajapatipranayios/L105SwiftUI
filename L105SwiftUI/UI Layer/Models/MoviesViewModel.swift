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
    
    private let apiService: MovieAPILogic
//    private let apiService: MovieAPI
    
    //init(apiService: MovieAPILogic,
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
}
