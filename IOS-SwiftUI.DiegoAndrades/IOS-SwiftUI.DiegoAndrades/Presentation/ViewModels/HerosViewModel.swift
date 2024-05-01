//
//  HerosViewModel.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 29/4/24.
//

import Combine
import Foundation

final class HerosViewModel: ObservableObject{
    @Published var heros: [HerosModel]?
    private var network: HeroUseCaseProtocol
    
    init(network: HeroUseCaseProtocol = HeroUseCase()) {
        self.network = network
        //lanzamos la carga
        getHeros()
    }
    
    func getHeros() {
        print("ejecuta get heros")
        Task{
            let data = await network.getHeros()
            print("finaliza llamada")
            DispatchQueue.main.async {
                 self.heros = data
            }
        }
    }
    
}
