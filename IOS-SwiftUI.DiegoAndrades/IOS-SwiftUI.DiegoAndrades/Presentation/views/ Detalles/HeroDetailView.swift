//
//  HeroDetailView.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 1/5/24.
//

import SwiftUI
import MarvelLibrary

struct HeroDetailView: View {
    var heroe: Result? // Variable de estado para almacenar el héroe seleccionado
    @State private var text: String = ""
    
    
    var body: some View {
        if let hero = heroe{
            VStack{
                Text("DETALLES DEL HEROE").font(MarvelApFonts().textXS)
                VStack{
                    DetailRowView(hero: hero)
                }
                VStack {
                    TextField(hero.description, text: $text)
                        .padding()
                        .foregroundColor(.red)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth:358) // Respetamos 16 puntos por cada lado
                        
                }
                
                
                NavigationStack{
               
                }
            }
        }
    }
}

// Vista de previsualización

#Preview {
    HeroDetailView(heroe: Result(
        id: 2,
        name: "A.I.M.",
        description: "AIM is a terrorist organization bent on destroying the world.",
        thumbnail: Thumbnail(
            path: "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec",
            thumbnailExtension: .jpg
        )
    )
    )
}
