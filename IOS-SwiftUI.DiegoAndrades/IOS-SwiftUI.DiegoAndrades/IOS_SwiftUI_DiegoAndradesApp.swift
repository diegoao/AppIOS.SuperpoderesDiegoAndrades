//
//  IOS_SwiftUI_DiegoAndradesApp.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 29/4/24.
//

import SwiftUI

@main
struct IOS_SwiftUI_DiegoAndradesApp: App {
    
    
    
    let appState = AppState() //viewModelGlobal
    
    
    var body: some Scene {
        WindowGroup {
            ViewRouter()
                .environmentObject(appState)
        }
    }
}
