//
//  AppState.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 29/4/24.
//

import Foundation
import Combine


enum AppStatus {
    case heroes, series
}


final class AppState: ObservableObject{
    @Published var status = AppStatus.heroes
    private var network : NetworkHerosProtocol
    
    init(network: NetworkHerosProtocol = NetworkHeros()){
        self.network = network
    }
}
