//
//  L105SwiftUIApp.swift
//  L105SwiftUI
//
//  Created by Auxano on 21/02/24.
//

import SwiftUI

@main
struct L105SwiftUIApp: App {
    @StateObject private var persistentController = MoviePersistentController()
    
    let viewModel = MoviesViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MoviesView()
                    .environmentObject(viewModel)
                    .environment(\.managedObjectContext,
                                  persistentController.persistentContainer.viewContext)
            }
        }
    }
}
