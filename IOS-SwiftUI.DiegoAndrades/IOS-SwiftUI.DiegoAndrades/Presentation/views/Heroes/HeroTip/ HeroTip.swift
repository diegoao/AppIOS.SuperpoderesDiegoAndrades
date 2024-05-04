//
//   HeroTip.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 4/5/24.
//

import Foundation
import TipKit

struct heroTip: Tip{
    var title: Text{
        Text("Pantalla de Heroes")
    }
    
    var message: Text?{
        Text("Puedes hacer Scroll para ver los distintos héroes a demás el héroe que tenga descripción puedes tambien hacer Scroll para leerlo su descripción completa")
    }
    
    var image: Image?{
        Image(systemName: "person.fill")
    }
    
    var options: [Option]{
        //veces que se muestra
        Tips.MaxDisplayCount(300)
    }
    
    
}
