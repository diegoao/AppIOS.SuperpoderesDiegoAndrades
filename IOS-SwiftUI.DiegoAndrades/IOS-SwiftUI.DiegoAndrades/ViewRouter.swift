//
//  ViewRouter.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 29/4/24.
//

import SwiftUI

struct ViewRouter: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        switch(appState.status){
        case .heroes:
            withAnimation {
                HeroesView(viewModel: HerosViewModel())
            }
            
        case .series:
            Text("Series")
        }
     
    }
}

#Preview {
    ViewRouter()
        .environmentObject(AppState())
}
