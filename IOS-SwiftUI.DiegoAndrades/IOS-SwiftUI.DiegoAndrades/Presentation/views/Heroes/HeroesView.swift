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
    @State private var filter: String = ""
    
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
        
    }
}
#Preview {
    HeroesView(viewModel: HerosViewModel(network: HeroUseCaseFake()))
}
