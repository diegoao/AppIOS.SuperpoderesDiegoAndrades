//
//  HeroDetailView.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 1/5/24.
//

import SwiftUI
import MarvelLibrary

struct HeroDetailView: View {
    
    @StateObject var viewModel: SeriesViewModel
    var heroe: Result? // Variable de estado para almacenar el héroe seleccionado
    @State private var text: String = ""
    

    var body: some View {
        if let hero = heroe{
            VStack(alignment: .center) {
                
                Text("DETALLES DEL HEROE").font(MarvelApFonts().textS)
                
                VStack{
                    DetailRowView(hero: hero)
                }
                
                .onAppear {
                    if hero.description.isEmpty{
                        text = "Este héroe no tiene descripción"
                    }else {
                        text = hero.description // Asignamos hero.description a text cuando la vista aparece
                    }
                }
                VStack{
                    Text("DESCRIPCIÓN").font(MarvelApFonts().textXS)
                    
                }
                
                VStack{
                    ScrollView {
                        VStack{
                            TextEditor(text: $text)
                                .padding()
                                .foregroundColor(.black)
                                .frame(maxWidth: 358, maxHeight: .infinity) // Usamos .infinity para permitir que el TextEditor crezca verticalmente
                                .frame(height: 150) // Ajusta el número de líneas que quieres mostrar
                        }
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

// Vista de previsualización

#Preview {
    HeroDetailView(viewModel: SeriesViewModel(id:1), heroe: Result(
        id: 2,
        name: "A.I.M.",
        description: "AIM is a terrorist organization bent on destroying the world.AIM is a terrorist organization bent on destroying the world.AIM is a terrorist organization bent on destroying the world.AIM is a terrorist organization bent on destroying the world.AIM is a terrorist organization bent on destroying the world.",
        thumbnail: Thumbnail(
            path: "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec",
            thumbnailExtension: .jpg
        )
    )
    )
}
