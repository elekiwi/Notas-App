//
//  FetchAllNotesUseCase.swift
//  Notas
//
//  Created by Leo Merelo on 26/12/23.
//

import Foundation

struct FetchAllNotesUseCase {
    var notesDatabase: NotesDatabaseProtocol
    
    init(notesDatabase: NotesDatabaseProtocol = NotesDatabase.shared) {
        self.notesDatabase = notesDatabase
    }
    
    func fetchAll () throws -> [Note] {
        try notesDatabase.fetchAll()
    }
}
