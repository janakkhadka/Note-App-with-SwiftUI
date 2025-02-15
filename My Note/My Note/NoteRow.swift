//
//  NoteRow.swift
//  My Note
//
//  Created by Janak Khadka on 15/02/2025.
//

import SwiftUI

struct NoteRow: View {
    let note: Note
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack{
                Text(note.title)
                Spacer()
                Image(systemName:
                        "note.text")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25,
                       height: 30)
                .foregroundColor(Color(red: 58/255,green: 127/255, blue: 147/255))
                .shadow(color: Color.gray,
                        radius: 10,
                        x: 0, //offset ko lagi
                        y: 0)
            }
            .padding()
            Text(note.description)
                .font(.body)
                .lineLimit(1) //text badi huda arko line maa najaos vanera
                //.truncationMode(.tail) //default tail nai hunxa, yesle chai kaa bata word lai katna suru garne vanne ho
                .padding(.horizontal)
                .padding(.bottom)
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(radius: 2)
        )
        .padding(.horizontal)
    }
}

#Preview {
    NoteRow(note: Note(title: "Today Note", description: "Today I am going ", createdAt: Date()))
}
