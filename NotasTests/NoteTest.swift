//
//  NotasTests.swift
//  NotasTests
//
//  Created by Leo Merelo on 26/12/23.
//

import XCTest
@testable import Notas

final class NoteTest: XCTestCase {

    func testNoteInitialization(){
        //Given
        let title = "Test title"
        let text = "Text test"
        let date = Date()
        
        //When
        let note = Note(title: title, text: text, createdAt: date)
        
        //Then
        XCTAssertEqual(note.title, title, "Title should be equal to Test title")
        XCTAssertEqual(note.text, text)
        XCTAssertEqual(note.createdAt, date)
    }
    
    func testNoteEmptyText(){
        //Given
        let title = "Test title"
        let date = Date()
        
        //When
        let note = Note(title: title, text: nil, createdAt: date)
        
        //Then
        XCTAssertEqual(note.title, title, "Title should be equal to Test title")
        XCTAssertEqual(note.getText, "")
        XCTAssertEqual(note.createdAt, date)
    }
    
}
