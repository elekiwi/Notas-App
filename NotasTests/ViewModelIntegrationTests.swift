//
//  ViewModelIntegrationTests.swift
//  NotasTests
//
//  Created by Leo Merelo on 28/12/23.
//

import XCTest
@testable import Notas

@MainActor
final class ViewModelIntegrationTests: XCTestCase {

    //system under test // que se está testeando viisible
    var sut: ViewModel!
    
    override func setUpWithError() throws {
        let database = NotesDatabase.shared
        database.container = NotesDatabase.setupContainer(inMemory: true)
        
        let createNotesUseCase = CreateNoteUseCase(noteDatabase: database)
        let fetchAllNotesUseCase = FetchAllNotesUseCase(noteDatabase: database)
        
        sut = ViewModel(createNoteUseCase: createNotesUseCase, fetchAllNotesUseCase: fetchAllNotesUseCase)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateNote(){
        //Given
        sut.createNoteWith(title: "Title 1", text: "Text 1")
        
        //When
        let note = sut.notes.first
        
        //Then
        XCTAssertNotNil(note)
        XCTAssertEqual(note?.title, "Title 1")
        XCTAssertEqual(note?.text  , "Text 1")
        XCTAssertEqual(sut.notes.count , 1, "There should be 1 note in DB")
    }
    
    func testCreateTwoNotes(){
        //Given
        sut.createNoteWith(title: "Title 1", text: "Text 1")
        sut.createNoteWith(title: "Title 2", text: "Text 2")
        
        //When
        let firstNote = sut.notes.first
        let lastNote = sut.notes.last
        
        //Then
        XCTAssertNotNil(firstNote)
        XCTAssertEqual(firstNote?.title, "Title 1")
        XCTAssertEqual(firstNote?.text  , "Text 1")
        XCTAssertNotNil(lastNote)
        XCTAssertEqual(lastNote?.title, "Title 2")
        XCTAssertEqual(lastNote?.text  , "Text 2")
        XCTAssertEqual(sut.notes.count , 2, "There should be 2 notes in DB")
    }
    
    func testFetchAllNotes(){
        //Given
        sut.createNoteWith(title: "Title 1", text: "Text 1")
        sut.createNoteWith(title: "Title 2", text: "Text 2")
        
        //When
        let firstNote = sut.notes[0]
        let lastNote = sut.notes[1]
        
        //Then
        XCTAssertEqual(sut.notes.count , 2, "There should be 2 notes in DB")
        XCTAssertEqual(firstNote.title, "Title 1")
        XCTAssertEqual(firstNote.text  , "Text 1")
        XCTAssertEqual(lastNote.title, "Title 2")
        XCTAssertEqual(lastNote .text  , "Text 2")
    }
    

    func testUpdateNote() {
        //Given
        sut.createNoteWith(title: "Title 1", text: "Text 1")
        
        let note = sut.notes.first
        let title = "New Title"
        let text = "New Text"
        
        //When
        if let note = sut.notes.first {
            sut.updateNoteWith(id: note.id, newTitle: title, newText: text)
        }
        
        //Then
        XCTAssertEqual(note?.title, title)
        XCTAssertEqual(note?.text  , text)
        
    }
}
