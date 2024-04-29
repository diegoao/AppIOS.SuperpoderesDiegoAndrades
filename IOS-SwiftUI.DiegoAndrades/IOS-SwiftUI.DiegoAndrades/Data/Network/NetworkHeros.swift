//
//  NetworkHeros.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 29/4/24.
//

import Foundation

protocol NetworkHerosProtocol {
    func getHeros() async -> [HerosModel]
}


final class NetworkHeros: NetworkHerosProtocol {
    func getHeros() async -> [HerosModel] {
        var modelReturn = [HerosModel]()
        
        let urlCad = "\(ConstantsApp.URL_API)\(Endpoints.characters.rawValue)\(ConstantsApp.TS)\(ConstantsApp.APIKEY)\(ConstantsApp.HASH)"
        var request = URLRequest(url: URL(string:urlCad)!)
        request.httpMethod = HTTPMethods.get
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        

        //Llamamos al servidor

        do{
            let(data, response)  = try await URLSession.shared.data(for: request)
            if let resp = response as? HTTPURLResponse{
                if resp.statusCode == HTTPResponseCodes.SUCESS{
                    modelReturn = try! JSONDecoder().decode([HerosModel].self, from: data)
                    modelReturn.removeLast()
                }
            }
        }catch{
            
        }
        return modelReturn
    }
}

