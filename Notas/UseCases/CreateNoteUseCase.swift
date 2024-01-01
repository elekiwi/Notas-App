//
//  CreateNoteUseCase.swift
//  Notasx
//
//  Created by Leo Merelo on 28/12/23.
//

import Foundation

struct CreateNoteUseCase {
    var noteDatabase: NotesDatabaseProtocol
    
    init(noteDatabase: NotesDatabaseProtocol = NotesDatabase.shared) {
        self.noteDatabase = noteDatabase
    }
    
    func createNoteWith(title: String, text: String) throws {
        let note = Note(title: title, text: text, createdAt: .now)
        try noteDatabase.insert(note: note)
    }
}
