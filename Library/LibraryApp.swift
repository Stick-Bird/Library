//
//  LibraryApp.swift
//  Library
//
//  Created by user on 2022-08-25.
//

import SwiftUI

@main
struct LibraryApp: App {
    var body: some Scene {
        WindowGroup {
            LibraryView()
                .environmentObject(LibraryModel())
        }
    }
}
  
