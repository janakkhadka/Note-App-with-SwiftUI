//
//  Note.swift
//  My Note
//
//  Created by Janak Khadka on 15/02/2025.
//

import Foundation

final class Note: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var createdAt: Date
    
    init(id: UUID = UUID(), title: String, description: String, createdAt: Date) {
        self.id = id
        self.title = title
        self.description = description
        self.createdAt = createdAt
    }
}
