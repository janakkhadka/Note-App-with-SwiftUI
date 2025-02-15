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
    let container: ModelContainer
    
    init() {
        do{
            container = try ModelContainer(for: Note.self)
        }
        catch {
            fatalError("cant initialize the model container")
        }
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}
