//
//  DetailRowView.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 1/5/24.
//

import SwiftUI
import MarvelLibrary

struct DetailRowView: View {
    var hero: Result
    
    var body: some View {
        
        ZStack(){
        

            
            VStack{
                ZStack{
                    Rectangle()
                        .fill(MarvelAppColor().primaryColor.opacity(0.8))
                        .frame(width:358, height: 35)
                        .cornerRadius(10)
                    Text("\(hero.name)")
                        .font(MarvelApFonts().textM)
                        .foregroundStyle(MarvelAppColor().BackgroundBox)
                    }
                AsyncImage(url: URL(string: "\(hero.thumbnail.path).\(hero.thumbnail.thumbnailExtension.rawValue)" )) { photo in
                    photo
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 358, height:  340)
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
                
                

            }
        }
       
    }
       
}

#Preview {
    DetailRowView(hero:
                    Result(
                        id: 2,
                        name: "Adam Warlock",
                        description: "Adam Warlock is an artificially created human who was born in a cocoon at a scientific complex called The Beehive.",
                        thumbnail: Thumbnail(
                            path: "http://i.annihil.us/u/prod/marvel/i/mg/a/f0/5202887448860",
                            thumbnailExtension: .jpg
                        )
                    )
    )
    
}