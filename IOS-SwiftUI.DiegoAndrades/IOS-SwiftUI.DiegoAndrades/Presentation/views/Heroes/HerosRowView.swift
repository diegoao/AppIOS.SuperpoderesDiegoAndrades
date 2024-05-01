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
        
        ZStack{
            Rectangle()
                .fill(MarvelAppColor().TerciaryColor.opacity(0.6))
                .frame(width: 362, height: 390)
                .cornerRadius(30)
            
            VStack{
                AsyncImage(url: URL(string: "\(hero.thumbnail.path).\(hero.thumbnail.thumbnailExtension.rawValue)" )) { photo in
                    photo
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height:  300)
                        .cornerRadius(10)
                        .padding([.leading, . trailing], 32)
                        .opacity(0.8)
                    
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .padding([.leading, . trailing], 32)
                        .opacity(1)
                }
                
                ZStack{
                    Rectangle()
                        .fill(MarvelAppColor().TerciaryColor.opacity(0.8))
                        .frame(width:340, height: 35)
                        .cornerRadius(30)
                    Text("\(hero.name)")
                        .font(MarvelApFonts().textM)
                        .foregroundStyle(MarvelAppColor().BackgroundBox)
                }
            }
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
