//
//  Favorito.swift
//  Favoritos
//
//  Created by soporte on 29/11/21.
//

import Foundation

// MARK: - Favorito
struct Favorito: Decodable {
    let id: Int
    let name, favoritoDescription: String
    let favoritoDefault: Bool
    let owner: Owner
    let createdAt: Date
    let visibility: String
    let products: [String: Product]
    let accessHash: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case favoritoDescription = "description"
        case favoritoDefault = "default"
        case owner, createdAt, visibility, products, accessHash
    }
}

// MARK: - Owner
struct Owner: Decodable {
    let name, email, linioID: String

    enum CodingKeys: String, CodingKey {
        case name, email
        case linioID = "linioId"
    }
}

// MARK: - Product
struct Product: Decodable {
    let id: Int
    let name: String
    let wishListPrice: Int
    let slug, url: String
    let image: String
    let linioPlusLevel: Int
    let conditionType: String
    let freeShipping, imported, active: Bool
}

typealias Favoritos = [Favorito]
