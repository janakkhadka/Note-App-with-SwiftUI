//
//  NoteRow.swift
//  My Note
//
//  Created by Janak Khadka on 15/02/2025.
//

import SwiftUI

struct NoteRow: View {
    var body: some View {
        HStack{
            Text("About my day")
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
    }
}

#Preview {
    NoteRow()
}
