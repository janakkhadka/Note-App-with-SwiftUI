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
//    @State private var title: String = ""
//    @State private var description: String = ""
    @Bindable var note: Note
    @FocusState private var isDescriptionFocused: Bool
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Title", text: $note.title)
                    .font(.headline)
                    .padding()
                
                Divider()
                    .padding()
                
                ZStack(alignment: .topLeading) { //zstack le chai z axis maa kaam garxa
                    TextEditor(text: $note.content) //texteditor le placeholder support gardaina tei vara placeholder jasto banako
                        .focused($isDescriptionFocused)
                        .padding(.horizontal)
                    
                    Text("Description")
                        .fontWeight(.bold)
                        .foregroundColor(.black.opacity(0.25))
                        .padding(.horizontal)
                        .hidden(isDescriptionFocused || !$note.wrappedValue.content.isEmpty)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button(action: {dismiss()}){
                        Text("Cancel")
                    }
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
                        if(!$note.title.wrappedValue.isEmpty && !$note.content.wrappedValue.isEmpty){
                            context.insert(note)
                            dismiss()
                        }
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
    NoteSheet(note: Note(title: "hello", description: "hello", createdAt: Date.now))
}
