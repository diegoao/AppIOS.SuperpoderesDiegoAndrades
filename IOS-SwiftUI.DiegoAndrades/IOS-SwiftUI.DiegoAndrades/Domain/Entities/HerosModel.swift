//
//  HerosModel.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 29/4/24.
//

import Foundation

// MARK: - Result
struct HerosModel: Codable, Identifiable {
    let id: Int
    let name, description: String
    let thumbnail: thumbnail

}

struct thumbnail: Codable {
    let path: String
    let `extension`: String
}
