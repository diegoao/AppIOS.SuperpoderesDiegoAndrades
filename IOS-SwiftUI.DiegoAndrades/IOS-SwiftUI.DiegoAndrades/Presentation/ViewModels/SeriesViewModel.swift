//
//  SeriesViewModel.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 2/5/24.
//

import Foundation

final class SeriesViewModel: ObservableObject{
    @Published var serie: [SeriesModel]?
    private var network: SeriesUseCaseProtocol
    private var id: Int = 0
    
    init(network: SeriesUseCaseProtocol = SeriesUseCase(), id: Int) {
        self.network = network
        self.id = id
        //lanzamos la carga
        getSeries()
    }
    
    func getSeries() {
        print("ejecuta get heros")
        Task{
            let data = await network.getSeries(filter: id )
            print("finaliza llamada")
            DispatchQueue.main.async {
                 self.serie = data
            }
        }
    }

}