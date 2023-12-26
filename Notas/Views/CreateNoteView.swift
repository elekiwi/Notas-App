//
//  CreateNoteView.swift
//  Notas
//
//  Created by Leo Merelo on 23/12/23.
//

import SwiftUI

struct CreateNoteView: View {
    
    var viewModel: ViewModel
    @State var title: String = ""
    @State var text: String  = ""
    
    //dismiiss para ocultar la lista del formulario
    //cuando no queremos y hemos clikado, o cuando se completa la nota
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("", text: $title, prompt: Text("*Título"), axis: .vertical)
                    TextField("", text: $text, prompt: Text("*Texto"), axis: .vertical)
                } footer: {
                    Text("* El título es obligatorio ")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    Button {
                        dismiss()
                    } label: {
                        Text("Cerrar")
                    }
                }
                
                ToolbarItem   {
                    Button {
                        viewModel.createNoteWith(title: title, text: text)
                        dismiss()
                    } label: {
                        Text("Crear nota")
                            .bold()
                    }
                }
                
            }
            .navigationTitle("Nueva nota")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

//tenemos que inyectarle los valors correspondientes, pa esto sirve el init
#Preview {
    CreateNoteView(viewModel: .init())
}
