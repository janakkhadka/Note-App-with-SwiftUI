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

extension Note {
    static var emptyList: [Note] {[]}
    static var mockData: [Note] {
        [
            Note(title: "About Friend Kishor", description: "my friend name is kishor acharya and he is very good. Nice to meet him", createdAt: Date().addingTimeInterval(-100000)),
            Note(title: "About Friend Bishal", description: "my friend name is Bishal Parajuli and he is very good. Nice to meet him", createdAt: Date().addingTimeInterval(-500000)),
            Note(title: "About Friend Subash", description: "my friend name is Subash Rajan Magar and he is very good. Nice to meet him", createdAt: Date().addingTimeInterval(-700000)),
            Note(title: "About Friend Satya", description: "my friend name is Satya Raj Awasthi and he is very good. Nice to meet him", createdAt: Date().addingTimeInterval(-400000)),
            Note(title: "About Friend Dipesh", description: "my friend name is Dipesh Bohora and he is very good. Nice to meet him", createdAt: Date().addingTimeInterval(-300000)),
            Note(title: "About Friend Roshan", description: "my friend name is Roshan Chaudhari and he is very good. Nice to meet him", createdAt: Date().addingTimeInterval(-600000)),
            Note(title: "About Friend Nadish", description: "my friend name is Nadhish acharya and he is very good. Nice to meet him", createdAt: Date().addingTimeInterval(-200000)),
        ]
        
    }
}
