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
                    .foregroundStyle(MarvelAppColor().TextColor1)
                
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
                        .foregroundStyle(MarvelAppColor().TextColor2)
                    
                }
                
                VStack{
                    ScrollView {
                        VStack{
                            TextEditor(text: $text)
                                .padding()
                                .foregroundColor(.white)
                                .frame(maxWidth: 358, maxHeight: .infinity) // Usamos .infinity para permitir que el TextEditor crezca verticalmente
                                .frame(height: 110) // Ajusta el número de líneas que quieres mostrar
                                .scrollContentBackground(.hidden)
                               
                        }
                        .background(Color.clear)
                    }
                    
                    Spacer()
                    
                }
                
                VStack{
                    
                    if let dato = viewModel.serie{
                        ScrollView(.horizontal){
                            LazyHStack{
                                ForEach(dato){ series in
                                    
                                    NetflixScrollView(serie: series)
 
                                }
                                
                            }
                            .frame(height: 170)
                        }
                    }else{
                        Text("No hay series")
                    }
                }
                Spacer()
            }

            .background(
                Image("fondo2")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.8))
            .background(Color.gray.opacity(0.5))
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
