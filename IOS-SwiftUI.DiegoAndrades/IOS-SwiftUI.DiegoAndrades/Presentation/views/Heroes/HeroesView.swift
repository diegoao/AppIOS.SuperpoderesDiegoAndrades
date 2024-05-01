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
        ZStack{
            Image(.fondo1)
                .resizable()
            VStack{
                NavigationStack{
                    
                    List{
                        if let heros = viewModel.heros?.first?.data.results {
                            ForEach(heros){ hero in
                                
                                HerosRowView(hero: hero)
                                
                            }
                        }
                    }
                    
                    .navigationBarTitle("Lista de Heroes", displayMode: .inline)
                    
                }
            }
        }

    }
}
#Preview {
    HeroesView(viewModel: HerosViewModel(network: HeroUseCaseFake()))
}
