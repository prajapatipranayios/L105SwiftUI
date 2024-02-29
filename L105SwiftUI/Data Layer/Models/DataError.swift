//
//  DataError.swift
//  L105SwiftUI
//
//  Created by Auxano on 21/02/24.
//

import Foundation

enum DataError: Error {
    case networkingError(String)
    case coreDataError(String)
}
