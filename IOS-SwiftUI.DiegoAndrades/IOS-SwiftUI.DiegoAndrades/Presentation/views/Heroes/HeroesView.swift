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
                if let heros = viewModel.heros?.first?.data.results {
                    ForEach(heros){ hero in
                        //foto del heroe
                        AsyncImage(url: URL(string: "\(hero.thumbnail.path).\(hero.thumbnail.thumbnailExtension.rawValue)" )) { imagen in
                           imagen
                                .resizable()
                                .cornerRadius(30)
                        Text(hero.name)
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

#Preview {
    HeroesView(viewModel: HerosViewModel(network: HeroUseCaseFake()))
}
