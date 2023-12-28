//
//  Note.swift
//  Notas
//
//  Created by Leo Merelo on 22/12/23.
//

import Foundation
import SwiftData

@Model
class Note: Identifiable, Hashable {
    @Attribute(.unique) var id: UUID
    let title: String
    let text: String?
    let createdAt: Date
    
    var getText: String {
        text ?? ""
    }
    
    init(id: UUID = UUID(), title: String, text: String?, createdAt: Date) {
        self.id = id
        self.title = title
        self.text = text
        self.createdAt = createdAt
    }
    
}
