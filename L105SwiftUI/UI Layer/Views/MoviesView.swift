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
                    MovieCardView(movie: movie)
                    //Text(movie.title)
                        //.font(.headline)
                        //.foregroundColor(.blue)
                }
            }
        }.onAppear(perform: {
            viewModel.getMovies()
        })
    }
}

#Preview {
    MoviesView()
        .environmentObject(MoviesViewModel())
}
