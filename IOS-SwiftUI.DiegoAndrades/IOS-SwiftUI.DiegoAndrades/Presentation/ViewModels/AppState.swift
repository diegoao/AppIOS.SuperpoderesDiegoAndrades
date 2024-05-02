//
//  AppState.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 29/4/24.
//

import Foundation



enum AppStatus {
    case heroes
    case detalles(id: Int)
}


final class AppState: ObservableObject{
    @Published var status = AppStatus.heroes
    private var network : NetworkHerosProtocol
    private var networkSeries : NetworkSeriesProtocol
    
    init(network: NetworkHerosProtocol = NetworkHeros(), networkSeries: NetworkSeriesProtocol = NetworkSeries()){
        self.network = network
        self.networkSeries = networkSeries
    }
    
    func goDetail(id: Int){
        Task{
            let series = await networkSeries.getSeries(filter: id)
            
            DispatchQueue.main.async {
                if series.isEmpty {
                    self.status = .detalles(id: id)
                }else{
                    print("No se han cargado datos")
                }
            }
        }
    }
}
