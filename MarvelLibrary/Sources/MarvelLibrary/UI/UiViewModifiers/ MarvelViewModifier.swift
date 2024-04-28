//
//   MarvelViewModifier.swift
//
//
//  Created by Macbook Pro on 28/4/24.
//

import SwiftUI

/// Modificador de vista para corner radius standar en la app propio
public struct MarvelCornerRadiusMod : ViewModifier{
    let value: CGFloat
    
    public init(value: CGFloat) {
        self.value = value
    }
    /// Content es el parametro de entrada de la vista
    /// Some View es el de salida
    public func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: self.value))
    }
}
