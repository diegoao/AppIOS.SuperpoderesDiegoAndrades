//
//  HerosRowView.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 1/5/24.
//

import SwiftUI
import MarvelLibrary

struct HerosRowView: View {
    var hero: Result
    
    var body: some View {

            VStack{
                AsyncImage(url: URL(string: "\(hero.thumbnail.path).\(hero.thumbnail.thumbnailExtension.rawValue)" )) { photo in
                    photo
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .padding([.leading, . trailing], 16)
                        .opacity(0.8)
                    
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .padding([.leading, . trailing], 16)
                        .opacity(0.7)
                }

                Text("\(hero.name)")
                    .font(MarvelApFonts().textM)
                    .bold()
                    .foregroundStyle(MarvelAppColor().TextColor1)
            }
        }
    }

#Preview {
    HerosRowView(hero:
            Result(
                id: 1,
                name: "3-D Man",
                description: "SuperHeroe fake 1",
                thumbnail: Thumbnail(
                    path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                    thumbnailExtension: .jpg
                )
                
            )
        )
        
}
