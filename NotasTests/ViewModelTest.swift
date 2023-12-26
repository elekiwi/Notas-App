//
//  ViewModelTest.swift
//  NotasTests
//
//  Created by Leo Merelo on 26/12/23.
//

import XCTest
@testable import Notas

final class ViewModelTest: XCTestCase {

    var viewModel: ViewModel!
    
    override func setUpWithError() throws {
        viewModel = ViewModel()
    }

    override func tearDownWithError() throws {
    }

    func testCreateNote(){
        //Given
        let title = "Hola title"
        let text = "Hola text"
        
        //When
        viewModel.createNoteWith(title: title, text: text)
      
        //Then
        XCTAssertEqual(viewModel.notes.count, 1)
        XCTAssertEqual(viewModel.notes.first?.title, title)
        XCTAssertEqual(viewModel.notes.first?.text, text)
        
    }
    
    func testCreate3Notes(){
        //Given
        let title1 = "Hola title1"
        let text1 = "Hola text1"
        
        let title2 = "Hola title2"
        let text2 = "Hola text2"
        
        let title3 = "Hola title3"
        let text3 = "Hola text3"
        
        //When
        viewModel.createNoteWith(title: title1, text: text1)
        viewModel.createNoteWith(title: title2, text: text2)
        viewModel.createNoteWith(title: title3, text: text3)
      
        //Then
        XCTAssertEqual(viewModel.notes.count, 3)
        XCTAssertEqual(viewModel.notes.first?.title, title1)
        XCTAssertEqual(viewModel.notes.first?.text, text1)
        XCTAssertEqual(viewModel.notes[1].title, title2)
        XCTAssertEqual(viewModel.notes[1].text, text2)
        XCTAssertEqual(viewModel.notes[2].title, title3)
        XCTAssertEqual(viewModel.notes[2].text, text3)
        
    }
    
    
    func testUpdateNote() {
        //Given
        let title = "Hola title"
        let text = "Hola text"
        viewModel.createNoteWith(title: title, text: text)

        let newTitle = "New Title"
        let newText = "New Text"
        
        //When
        if let id = viewModel.notes.first?.id {
            viewModel.updateNoteWith(id: id, newTitle: newTitle, newText: newText)
            
            //Then
            XCTAssertEqual(viewModel.notes.first?.title, newTitle)
            XCTAssertEqual(viewModel.notes.first?.text, newText)
            
        } else {
            XCTFail("Note was not created. Try again")
        }
    }
    
    func testRemoveNote() {
        //Given
        let title = "Hola title"
        let text = "Hola text"
        viewModel.createNoteWith(title: title, text: text)

        if let id = viewModel.notes.first?.id {
            //When
            viewModel.removeNoteWith(id: id)
            
            //Then
            XCTAssertTrue(viewModel.notes.isEmpty)
        } else {
            XCTFail("Note was not created. Try again")

        }

    }

}
