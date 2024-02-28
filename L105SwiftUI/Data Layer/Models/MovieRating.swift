//
//  TopRatedMovie.swift
//  L105SwiftUI
//
//  Created by Auxano on 27/02/24.
//

import Foundation

struct TopRatedMovieRootResult: Codable {
    let page: Int
    let topRatedMovies: [MovieRating]
    
    enum CodingKeys: String, CodingKey {
        case page
        case topRatedMovies = "results"
    }
}

struct MovieRating: Codable, Identifiable {
    let id: Int
    let title: String
    let popularity: Double
    let voteCount: Int
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case title = "original_title"
        case popularity
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
    }
    
    //  example calculation
    func minVote() -> Double {
        return voteAverage / Double.random(in: 2...2.5)
    }
    
    //  example calculation
    func maxVote() -> Double {
        return voteAverage / Double.random(in: 0.5...1)
    }
}
