//
//  NoteSheet.swift
//  My Note
//
//  Created by Janak Khadka on 15/02/2025.
//

import SwiftUI


//hiden function lai override gareko vanam, bool lidaina bydefault, so lios vanera
extension View {
    @ViewBuilder public func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
}

struct NoteSheet: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @FocusState private var isDescriptionFocused: Bool
    
    @Environment(\.modelContext) var context
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Title", text: $title)
                    .font(.headline)
                    .padding()
                
                Divider()
                    .padding()
                
                ZStack(alignment: .topLeading) { //zstack le chai z axis maa kaam garxa
                    TextEditor(text: $description) //texteditor le placeholder support gardaina tei vara placeholder jasto banako
                        .focused($isDescriptionFocused)
                        .padding(.horizontal)
                    
                    Text("Description")
                        .fontWeight(.bold)
                        .foregroundColor(.black.opacity(0.25))
                        .padding(.horizontal)
                        .hidden(isDescriptionFocused)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel"){}
                        .frame(width: 100, height: 40)
                        .foregroundColor(Color.white)
                        .background(Color.red)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 20)
                        )
                        .shadow(
                            color: .gray,
                            radius: 5
                        )
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button(action:{
                        context.insert(
                            Note(title: title, description: description, createdAt: Date.now)
                        )
                    }){
                        Text("Save")
                    }
                        .frame(width: 100, height: 40)
                        .foregroundColor(Color.white)
                        .background(Color(red: 58/255,green: 127/255, blue: 147/255))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 20)
                        )
                        .shadow(
                            color: .gray,
                            radius: 5
                        )
                }
            }
            .navigationTitle("Add New Note")
        }
    }

}

#Preview {
    NoteSheet()
}
