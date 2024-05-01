//
//  HeroesView.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 29/4/24.
//

import SwiftUI
import MarvelLibrary

struct HeroesView: View {
    
    @StateObject var viewModel: HerosViewModel
    @State private var selectedHero: Result? // Variable de estado para almacenar el héroe seleccionado
    
    var body: some View {
        VStack{
            Text("LISTADO DE HEROES").font(MarvelApFonts().textXS)
            NavigationStack{
                List{
                    
                    if let heros = viewModel.heros?.first?.data.results {
                        ForEach(heros){ hero in
                            
                            HerosRowView(hero: hero)
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.white.opacity(0)) // Elimino el color de fondo de la lista
                                .onTapGesture {
                                    selectedHero = hero // Almacenar el héroe seleccionado
                                    HeroDetailView(heroe: hero)
                                }
                        }
                    }
                }
                
                .listStyle(PlainListStyle())
                .background(
                    Image("fondo1")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .opacity(0.8))
                .background(Color.black.opacity(0.5))
                
            }
            
        }
//        ZStack(alignment: .topTrailing) {
//            
//            TabView(){
//                //LIsta de Heros
//                HeroesView(viewModel: HerosViewModel())
//                    .tabItem {
//                        Image (systemName:"house")
//                        Text ( "Heros")
//                    }
//                // Keepcoders
//                VStack{
//                    Text ( "Keepcoders")
//                }
//                .tabItem {
//                    Image (systemName:"person.2")
//                    Text ("Keepcoders")
//                }
//                //Configuracion
//                VStack{
//                    Text("Configuración")
//                }
//                
//                .tabItem {
//                    Image (systemName: "gear.badge.checkmark")
//                    Text ("Config")
//                }
//            }
//        }
    }
}
#Preview {
    HeroesView(viewModel: HerosViewModel(network: HeroUseCaseFake()))
}
