//
//  File.swift
//  
//
//  Created by Macbook Pro on 28/4/24.
//

import SwiftUI

///Botón - usar por defecto


public struct MarvelButton <Content: View> : View {
    @Environment(\.colorScheme) var colorScheme
    
    //atributos y acciones del boton
    let content: Content
    let action: () -> Void
    let cornerRadius: CGFloat
    let padding: CGFloat
    
    //inicializadores
    public init(@ViewBuilder content: @escaping ()-> Content,
                action: @escaping ()->Void,
                cornerRadius: CGFloat = 30.0,
                padding: CGFloat = 10.0){
        
        self.content = content()
        self.action = action
        self.cornerRadius = cornerRadius
        self.padding = padding
    }
    
    //Creamos el body
    public var body: some View{
        Button(action: self.action, label: {
            content
        })
            .padding(self.padding)
            .background(MarvelAppColor(colorScheme: colorScheme).primaryColor)
            .MarvelCornerRadius(value: cornerRadius)
            .font(MarvelApFonts().textS)
            .foregroundColor(MarvelAppColor(colorScheme: colorScheme).SecundaryColor)
    }
    
}


#if DEBUG
struct ContentView_MarvelButton: View {
    var body: some View {
        MarvelButton {
            Text("Mi Botón")
        } action: {
            //No hago nada
            let _ = print("Probando boton")
        }

    }
}
#Preview{
    ContentView_MarvelButton()
}

#endif
