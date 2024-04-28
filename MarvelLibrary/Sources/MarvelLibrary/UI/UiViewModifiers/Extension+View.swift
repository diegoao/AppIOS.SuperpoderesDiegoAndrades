//
//  Extension+View.swift
//
//
//  Created by Macbook Pro on 28/4/24.
//

import SwiftUI

///Extensión para añadir los modificadores
extension View{
    ///MarvelCornerRadius  = Nombre a usar en SwiftUI
    public func MarvelCornerRadius(value: CGFloat) -> some View {
        modifier(MarvelCornerRadiusMod(value: value))
    }
}
