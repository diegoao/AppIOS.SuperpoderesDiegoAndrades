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

    var body: some View {
//        ZStack{
//            Image(.fondo1)
//                .opacity(0.8)
//                .scaledToFill()
//            Image(decorative: "")
//                .resizable()
//                .background(.white)
//                .opacity(0.10)
//                
//        }
        NavigationStack{
            List{
                if let heros = viewModel.heros {
                    ForEach(heros){ hero in
                        //foto del heroe
                        let _ = print("hero \(hero.name)")
                        AsyncImage(url: URL(string: hero.name)) { imagen in
                            
                           imagen
                                .resizable()
                                .cornerRadius(30)
                            
                        } placeholder: {
                            Image(systemName: "photo")
                                .resizable()
                                .cornerRadius(30)
                        }

                        
                    }
                }
            }
        }
        
    }
}

//#Preview {
//    HeroesView()
//        .environmentObject(HerosViewModel(network: NetworkHeros()))
//}
