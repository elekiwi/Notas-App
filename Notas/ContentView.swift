//
//  ContentView.swift
//  Notas
//
//  Created by Leo Merelo on 22/12/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var viewModel: ViewModel = .init()
    @State var showCreateNote: Bool = false
    
    var body: some View {
        NavigationStack  {
            List {
                ForEach(viewModel.notes) { note  in
                    NavigationLink(value: note){
                        VStack(alignment: .leading){
//                            NoteListCellView(title: note.title, text: note.getText)
                            Text(note.title)
                                .foregroundStyle(.primary)
                            Text(note.getText)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                
            }
            .toolbar {
                //if not status default is on top toolbar
                ToolbarItem(placement: .status) {
                    Button {
                        showCreateNote.toggle()
                    } label: {
                        Label("Crear Nota ", systemImage: "square.and.pencil" )
                            .labelStyle(TitleAndIconLabelStyle())
                    }
                    .buttonStyle(.bordered)
                    .tint(.blue)
                    .bold()
                }
            }
            .navigationTitle("Notas")
            .navigationDestination(for: Note.self, destination: { note in
                UpdateNoteView(viewModel: viewModel, id: note.id, title: note.title, text: note.getText)
            })
            .fullScreenCover(isPresented: $showCreateNote, content: {
                CreateNoteView(viewModel: viewModel) 
            })
        }
    }
}

#Preview() {
    
    ContentView(viewModel: .init(notes: [
        .init(title: "Hola qeu ", text: "Si qeu tl", createdAt: .now),
        .init(title: "Texto 2 ", text: "Si qeu tl", createdAt: .now)
    ]))
    
}
