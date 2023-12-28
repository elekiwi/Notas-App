//
//  FetchAllNotesUseCase.swift
//  Notas
//
//  Created by Leo Merelo on 28/12/23.
//

import Foundation

struct FetchAllNotesUseCase {
    var noteDatabase: NotesDatabaseProtocol
    
    init(noteDatabase: NotesDatabaseProtocol = NotesDatabase.shared) {
        self.noteDatabase = noteDatabase
    }
     
    func fetchAll() throws -> [Note] {
        try noteDatabase.fetchAll()
    }
}
