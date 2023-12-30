//
//  NoteListCellView.swift
//  Notas
//
//  Created by Leo Merelo on 29/12/23.
//

import SwiftUI

struct NoteListCellView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack (alignment: .leading) {
                Text(title)
                    .bold()
                    .lineLimit(1)
                Divider()
                Text(text)
                
            }
                .padding()
                .frame(width: 180, height: 180 ,alignment: .topLeading)
                .background(.brandYellow)
                .cornerRadius(20)
                .shadow(radius: 3)
    }
}

#Preview {
    NoteListCellView(title: "HELLO", text: "world")
}
