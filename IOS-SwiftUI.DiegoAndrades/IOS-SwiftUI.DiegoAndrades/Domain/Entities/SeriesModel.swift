//
//  SeriesModel.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 2/5/24.
//

import Foundation

// MARK: - SeriesModel
struct SeriesModel: Codable {
    let data: DatoClass
}

// MARK: - DataClass
struct DatoClass: Codable {
    let results: [Resultado]
}

// MARK: - Result
struct Resultado: Codable {
    let id: Int
    let title: String
    let description: String?
    let startYear, endYear: Int
    let thumbnail: Thumbnail1
    let creators: Creators
}

// MARK: - Creators
struct Creators: Codable {
    let items: [CreatorsItem]
}

// MARK: - CreatorsItem
struct CreatorsItem: Codable {
    let name: String
    let role: Role
}
// MARK: - Role
enum Role: String, Codable {
    case colorist = "colorist"
    case coloristCover = "colorist (cover)"
    case editor = "editor"
    case inker = "inker"
    case letterer = "letterer"
    case other = "other"
    case painterCover = "painter (cover)"
    case penciler = "penciler"
    case pencilerCover = "penciler (cover)"
    case penciller = "penciller"
    case pencillerCover = "penciller (cover)"
    case writer = "writer"
}


// MARK: - Thumbnail1
struct Thumbnail1: Codable {
    let path: String
    let thumbnailExtension: Extension1

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum Extension1: String, Codable {
    case jpg = "jpg"
}


    