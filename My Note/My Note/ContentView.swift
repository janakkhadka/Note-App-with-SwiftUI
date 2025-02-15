//
//  ContentView.swift
//  My Note
//
//  Created by Janak Khadka on 15/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var notes = Note.emptyList
    
    var body: some View {
        GeometryReader { geometry in  //GeometryReader le chai parent view vannale yaa chai Content view ko size and position reads garera adjust garna help garxa
            ScrollView {
                VStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(
                            Color(red: 58/255,green: 127/255, blue: 147/255)
                        )
                        .frame(height: geometry.size.height / 2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(Color.white.opacity(0.3))
                                .frame(width: .infinity,
                                       height: 200)
                                .overlay(
                                    VStack {
                                        Text("JK")
                                            .font(.custom("Zapfino", size: 35))
                                            .fontWeight(.bold)
                                        //.padding(.bottom, 1)
                                        Text("Welcome to JK Notes")
                                            .font(.system(size: 24, weight: .bold))
                                    }
                                )
                                .padding()
                                .foregroundColor(.white)
                            
                            
                        )
                    if(notes.isEmpty){
                        NoteRowEmpty()
                            .offset(y: 100)
                    }
                    
                    ForEach(notes){ note in //notes vako jatilai NoteRow maa dipslay garako ho
                        NoteRow(note: note)
                    }
                }
            }
            .background(Color.gray.opacity(0.2))

        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    ContentView()
}
