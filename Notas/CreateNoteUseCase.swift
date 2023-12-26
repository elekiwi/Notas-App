//
//  CreateNoteUseCase.swift
//  Notas
//
//  Created by Leo Merelo on 26/12/23.
//

import Foundation

struct CreateNoteUseCase {
    var notesDatabase: NotesDatabaseProtocol
    
    init(notesDatabase: NotesDatabaseProtocol = NotesDatabase.shared ) {
        self.notesDatabase = notesDatabase
    }
     
    func createNoteWith(title: String, text: String) throws {
        let note: Note = .init(id: .init(), title: title, text: text, createdAt: .now)
        try notesDatabase.insert(note: note)
         
    }
}
