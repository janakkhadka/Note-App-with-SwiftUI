//
//  NoteRowEmpty.swift
//  My Note
//
//  Created by Janak Khadka on 15/02/2025.
//

import SwiftUI

struct NoteRowEmpty: View {
    var body: some View {
        VStack{
            Image(
                systemName: "doc.plaintext"
            )
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 45,
                   height: 50)
            .foregroundColor(Color(red: 58/255,green: 127/255, blue: 147/255))
            
            Text("No Notes")
                .font(.system(size: 24, weight: .bold))
        }
    }
}

#Preview {
    NoteRowEmpty()
}
