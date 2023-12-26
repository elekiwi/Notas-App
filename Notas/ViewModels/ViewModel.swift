//
//  ViewModel.swift
//  Notas
//
//  Created by Leo Merelo on 22/12/23.
//

import Foundation
import Observation

@Observable
class ViewModel {
    
     var notes: [Note]
    
    //se crea un array vacio cada vez q instanciemos vm
    init(notes: [Note] = []){
        self.notes = notes
    }
    
    func createNoteWith(title: String, text: String){
        let note = Note(title: title, text: text, createdAt: .now)
        notes.append(note)
    }
    
    func updateNoteWith(id: UUID, newTitle: String, newText: String?){
        if let index = notes.firstIndex(where: { $0.id == id } ){
            let updateNote = Note(id: id, title: newTitle, text: newText, createdAt: notes[index].createdAt)
            notes[index] = updateNote
        }
    }
    
    func removeNoteWith(id: UUID){
        notes.removeAll(where: { $0.id == id})
    }
}
