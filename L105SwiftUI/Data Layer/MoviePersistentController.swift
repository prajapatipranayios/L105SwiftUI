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
    
    init() {
        persistentContainer.loadPersistentStores { storeDescription, error in
            if let error = error {
                print("error = \(error)")
            }
        }
    }
}
