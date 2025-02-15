//
//  ContentView.swift
//  My Note
//
//  Created by Janak Khadka on 15/02/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var notes = Note.emptyList
    @State private var isShowingSheet = false
    @State private var selectedNote: Note = Note(title: "", description: "")
    
    @Query(sort: \Note.title) var swiftDataNotes: [Note]
    
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
                                        Text("Welcome to JK Notes")
                                            .font(.system(size: 24, weight: .bold))
                                    }
                                )
                                .padding()
                                .foregroundColor(.white)
                            
                        )
                    //yedi kunai notes xaina vane
                    if(swiftDataNotes.isEmpty){
                        NoteRowEmpty()
                            .offset(y: 100)
                    }
                    
                    ForEach(swiftDataNotes) { note in //notes vako jatilai NoteRow maa dipslay garako ho
                        NoteRow(note: note)
                            .onTapGesture {
                                print("note tapped")
                                selectedNote = note
                                isShowingSheet = true
                            }
                    }
                }
            }
            .sheet(isPresented: $isShowingSheet){
                NoteSheet(note: selectedNote)
                    .presentationDetents([
                        .fraction(0.7),.large
                    ])
            }
            .background(Color.gray.opacity(0.2))
            .overlay(
                HStack {
                    //Spacer()  //spacer le chai button lai rightmost maa lagxa, hstack vako le
                    Button(action: {isShowingSheet = true}){
                        Image(
                            systemName: "plus"
                        )
                        .padding()
                        .background(Color(red: 58/255,green: 127/255, blue: 147/255))
                        .foregroundColor(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color(red: 58/255,green: 127/255, blue: 147/255), radius: 10)
                    }
                }.padding(),
                alignment: .bottomTrailing //bottom trailing vayesi mathi spacer chaidaina
            )

        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    ContentView()
}
