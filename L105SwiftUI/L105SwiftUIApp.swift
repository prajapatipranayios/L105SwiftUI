//
//  L105SwiftUIApp.swift
//  L105SwiftUI
//
//  Created by Auxano on 21/02/24.
//

import SwiftUI

@main
struct L105SwiftUIApp: App {
    let viewModel = MoviesViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MoviesView()
                    .environmentObject(viewModel)
            }
        }
    }
}
