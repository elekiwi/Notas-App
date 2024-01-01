//
//  UpdateNoteUseCase.swift
//  Notas
//
//  Created by Leo Merelo on 30/12/23.
//

import Foundation

struct UpdateNoteUseCase {
    var noteDatabase: NotesDatabaseProtocol
    
    init(noteDatabase: NotesDatabaseProtocol = NotesDatabase.shared) {
        self.noteDatabase = noteDatabase
    }
    
    func updateNoteWith(note: Note) throws {
        //let updatedNote = Note(id: note.id, title: note.title, text: note.text, createdAt: note.date)
        let updatedNote = Note(id: note.id, title: note.title, text: note.text, createdAt: note.createdAt)
        try noteDatabase.insert(note: updatedNote)
        
    }
    
}
