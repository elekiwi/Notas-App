//
//  UpdateNoteView.swift
//  Notas
//
//  Created by Leo Merelo on 26/12/23.
//

import SwiftUI

struct UpdateNoteView: View {
    var viewModel: ViewModel
    let id: UUID
    @State var title: String = ""
    @State var text: String  = ""
    
    //dismiiss para ocultar la lista del formulario
    //cuando no queremos y hemos clikado, o cuando se completa la nota
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("", text: $title, prompt: Text("*Título"), axis: .vertical)
                    TextField("", text: $text, prompt: Text("*Texto"), axis: .vertical)
                }
            }
            
            Button {
                viewModel.removeNoteWith(id: id)
                dismiss()
            } label: {
                Text("Eliminar nota")
                    .foregroundStyle(.gray)
                    .underline()
            }
            
            Spacer()
        }
        .background(Color(uiColor: .systemGroupedBackground))
        .toolbar {
            ToolbarItem   {
                Button {
                    viewModel.updateNoteWith(id: id, newTitle: title, newText: text)
                    dismiss()
                } label: {
                    Text("Guardar")
                        .bold()
                }
            }
            
        }
        .navigationTitle("Modificar nota")
    }
}

#Preview {
    NavigationStack {
        UpdateNoteView(viewModel: .init(), id: .init(), title: "Título de prueba", text: "Con diez cañones por banda, viento en popaa toda vela")
    }
}
