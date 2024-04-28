//
//  MarvelColor.swift
//
//
//  Created by Macbook Pro on 28/4/24.
//

import SwiftUI

///Struct de colores general de la App

public struct MarvelAppColor{
    private var colorScheme: ColorScheme = .light
    
    public init(colorScheme: ColorScheme = .light) {
        self.colorScheme = colorScheme
    }
    
    ///Color principal de la App
    public var primaryColor: Color{
        switch colorScheme {
        case .light:
            return Color(red: 243.0/255.0, green: 144.0/255.0, blue: 0.0)
        case .dark:
            return Color.gray
            
        @unknown default:
            return Color.purple
        }
    }
    
    ///Color secundario de la App
    public var SecundaryColor = Color.white
    
    ///Color de texto
    public var TextColor1 = Color(red: 243.0/255.0, green: 144.0/255.0, blue: 0.0)
    public var TextColor2 = Color(red: 221/255, green: 99/255, blue: 0)
    public var TextColor3 = Color(.black)
    
    ///Color  fondo caja de texto
    public var BackgroundBox = Color(red:255, green:255, blue:255, opacity: 0.8)
}

