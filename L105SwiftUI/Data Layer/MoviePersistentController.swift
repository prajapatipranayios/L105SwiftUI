//
//  MoviePersistentController.swift
//  L105SwiftUI
//
//  Created by Auxano on 28/02/24.
//

import Foundation
import CoreData

class MoviePersistentController: ObservableObject {
    var persistentContainer = NSPersistentContainer(name: "MovieFan")
    //private var moviesFetchRequest: NSFetchRequest<MovieCD> = MovieCD.fetchRequest()
    private var moviesFetchRequest = MovieCD.fetchRequest()
    private var movieRatingFetchRequest = MovieRatingCD.fetchRequest()
    
    init() {
        persistentContainer.loadPersistentStores { storeDescription, error in
            if let error = error {
                print("error = \(error)")
            }
        }
    }
    
    func addAndUpdateServerDataToCoreData(moviesFromBackend: [Movie]?) {
        // 0. prepare incoming server side movies ID list and dictionary
        var movieIdDict: [Int: Movie] = [:]
        var movieIdList: [Int] = []
        
        guard let movies = moviesFromBackend,
            !movies.isEmpty else {
            return
        }
        
        for movie in movies {
            movieIdDict[movie.id] = movie
            //movieIdList.append(movie.id)
        }
        movieIdList = movies.map { $0.id }
        
//        guard let moviesFetchRequest = moviesFetchRequest else {
//            return
//        }
        
        // 1. get all movies that match incoming server side movie ids
        //    find any existing movies in our local CoreData
        moviesFetchRequest.predicate = NSPredicate(
            format: "id IN %@", movieIdList
        )
        
        // 2. make a fetch request using predicate
//        guard let managedObjectContext = persistentContainer.viewContext else {
//            return
//        }
        
        let managedObjectContext = persistentContainer.viewContext
        
        let moviesCDList = try? managedObjectContext.fetch(moviesFetchRequest)
        print("moviesCDList = \(moviesCDList)")
        
        guard let moviesCDList = moviesCDList else {
            return
        }
        
        var moviesIdListInCD: [Int] = []
        
        // 3. update all matching movies to have the same data
        //    server side movies
        for movieCD in moviesCDList {
            moviesIdListInCD.append(Int(movieCD.id))
            
            managedObjectContext.delete(movieCD)
            
//                        if let movie = movieIdDict[Int(movieCD.id)] {
//                            movieCD.setValue(movie.overview,
//                                             forKey: "overview")
//                            movieCD.setValue(movie.title,
//                                             forKey: "title")
//                            movieCD.setValue(movie.imageUrlSuffix,
//                                             forKey: "imageUrlSuffix")
//                            movieCD.setValue(movie.releaseDate,
//                                             forKey: "releaseDate")
//                        }
        }
        
        // 4. add new objects coming from the backend/server side
        for movie in movies {
            if !moviesIdListInCD.contains(movie.id) {
                let GenreCD = GenreCD(context: managedObjectContext)
                GenreCD.id = 1
                GenreCD.title = "Comedy"
                
                let movieCD = MovieCD(context: managedObjectContext)
                movieCD.id = Int64( movie.id)
                movieCD.overview = movie.overview
                movieCD.title = movie.title
                movieCD.releaseDate = movie.releaseDate
                movieCD.imageUrlSuffix = movie.imageUrlSuffix
                movieCD.genre = GenreCD
                
            }
        }
        
        // 5. save changes
        try? managedObjectContext.save()
    }
    
    func addAndUpdateMovieRatingServerDataToCoreData(movieRatingFromBackend: [MovieRating]?) {
        // 0. prepare incoming server side movie rating ID list and dictionary
        var movieRatingsIdDist: [Int: MovieRating] = [:]
        var movieRatingsIdList: [Int] = []
        
        guard let movieRatings = movieRatingFromBackend,
              !movieRatings.isEmpty else {
            return
        }
        
        for movieRating in movieRatings {
            movieRatingsIdDist[movieRating.id] = movieRating
        }
        movieRatingsIdList = movieRatings.map { $0.id }
        
        // 1. get all movie ratings that match incoming server side movie rating ids
        // find any existing movie ratings in our local CoreData
        movieRatingFetchRequest.predicate = NSPredicate(
            format: "id in %@", movieRatingsIdList
        )
        
        // 2. make a fetch request using predicate
        let managedObjectContext = persistentContainer.viewContext
        
        let movieRatingsCDList = try? managedObjectContext.fetch(moviesFetchRequest)
        print("movieRatingsCDList = \(movieRatingsCDList)")
        
        guard let movieRatingsCDList = movieRatingsCDList else {
            return
        }
        
        var movieRatingsIdListInCD: [Int] = []
        
        // 3. update all matching movies from CoreData to have the same data
        // server side movies
        for movieRatingCD in movieRatingsCDList {
            movieRatingsIdListInCD.append(Int(movieRatingCD.id))
            
            if let movieRating = movieRatingsIdDist[Int(movieRatingCD.id)] {
                movieRatingCD.setValue(movieRating.popularity, forKey: "popularity")
                movieRatingCD.setValue(movieRating.title, forKey: "title")
                movieRatingCD.setValue(movieRating.voteAverage, forKey: "voteAverage")
                movieRatingCD.setValue(movieRating.voteCount, forKey: "voteCount")
            }
        }
        
        // 4. add new objects coming from the backend/server side
        for movieRating in movieRatings {
            if !movieRatingsIdListInCD.contains(movieRating.id) {
                let movieRatingCD = MovieRatingCD(context: managedObjectContext)
                movieRatingCD.id = Int64(movieRating.id)
                movieRatingCD.popularity = movieRating.popularity
                movieRatingCD.voteCount = Int64(movieRating.voteCount)
                movieRatingCD.voteAverage = movieRating.voteAverage
            }
        }
        
        // 5. save changes
        try? managedObjectContext.save()
    }
    
    func fetchMoviesFromCoreData() -> [Movie] {
        //let movieTitleSortDescriptor = NSSortDescriptor(key: "title", ascending: false)
        let movieReleaseDateSortDescriptor = NSSortDescriptor(key: "releaseDate", ascending: true)
        
        moviesFetchRequest.sortDescriptors = [movieReleaseDateSortDescriptor]
        
        let movieCDList = try? persistentContainer.viewContext.fetch(moviesFetchRequest)
        
        //movies = []
        var convertedMovies: [Movie] = []
        
        guard let movieCDList = movieCDList else {
            return []
        }
        
        for movieCD in movieCDList {
            let movie = Movie(id: Int(movieCD.id),
                              title: movieCD.title ?? "",
                              releaseDate: movieCD.releaseDate ?? "",
                              imageUrlSuffix: movieCD.imageUrlSuffix ?? "",
                              overview: movieCD.overview ?? "")
            convertedMovies.append(movie)
        }
        
        return convertedMovies
    }
    
    func fetchMovieRatingsFromCoreData() -> [MovieRating] {
        
        let movieRatingVoteCountSortDescriptor = NSSortDescriptor(key: "voteCount",
                                                                  ascending: true)
        movieRatingFetchRequest.sortDescriptors = [movieRatingVoteCountSortDescriptor]
        
        let movieRatingsCDList = try? persistentContainer.viewContext.fetch(movieRatingFetchRequest)
        
        var convertedMovieRatings: [MovieRating] = []
        
        guard let movieRatingsCDList = movieRatingsCDList else {
            return []
        }
        
        for movieRatingCD in movieRatingsCDList {
            let movieRating = MovieRating(id: Int(movieRatingCD.id),
                                          title: movieRatingCD.title ?? "",
                                          popularity: movieRatingCD.popularity,
                                          voteCount: Int(movieRatingCD.voteCount),
                                          voteAverage: movieRatingCD.voteAverage)
            convertedMovieRatings.append(movieRating)
        }
        
        return convertedMovieRatings
    }
}
