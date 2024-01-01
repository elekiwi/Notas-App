//
//  RemoveNoteUseCase.swift
//  Notas
//
//  Created by Leo Merelo on 1/1/24.
//

import Foundation

struct RemoveNoteUseCase {
    var noteDatabase: NotesDatabaseProtocol
    
    init(noteDatabase: NotesDatabaseProtocol = NotesDatabase.shared) {
        self.noteDatabase = noteDatabase
    }
     
    func removeNote(note: Note) throws  {
        try noteDatabase.delete(note: note)
    }
}
