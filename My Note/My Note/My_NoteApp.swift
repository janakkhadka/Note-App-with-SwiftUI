//
//  My_NoteApp.swift
//  My Note
//
//  Created by Janak Khadka on 15/02/2025.
//

import SwiftUI
import SwiftData

@main
struct My_NoteApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Note.self)
    }
}
