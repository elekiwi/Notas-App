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
    
    var createNoteUseCase: CreateNoteUseCase
    var fetchAllNotesUseCase: FetchAllNotesUseCase
    
    //se crea un array vacio cada vez q instanciemos vm
    init(notes: [Note] = [],
         createNoteUseCase: CreateNoteUseCase = CreateNoteUseCase(),
         fetchAllNotesUseCase: FetchAllNotesUseCase = FetchAllNotesUseCase() ){
        
        self.notes = notes
        //this is injection of use cases
        self.createNoteUseCase = createNoteUseCase
        self.fetchAllNotesUseCase = fetchAllNotesUseCase
        fetchAllNotes()  
    }
    
    func createNoteWith(title: String, text: String){
        do {
            try createNoteUseCase.createNoteWith(title: title, text: text)
            fetchAllNotes() 
        } catch {
            print("Error \(error.localizedDescription )")
        }
//        let note = Note(title: title, text: text, createdAt: .now)
//        notes.append(note)
    }
    
    func fetchAllNotes() {
        do {
            notes = try fetchAllNotesUseCase.fetchAll()
        } catch {
            print("Error \(error.localizedDescription )")
        }
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
