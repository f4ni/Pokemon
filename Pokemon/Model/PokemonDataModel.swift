//
//  PokemonDataModel.swift
//  Pokemon
//
//  Created by Furkan ic on 14.03.2024.
//

import Foundation

struct PokemonDataModel: Codable, Identifiable, Hashable {
    var id: Int?
    var name: String?
    var description: String?
    var imageUrl: String?
    
    init() {}
}
