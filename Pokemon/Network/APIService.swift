//
//  APIService.swift
//  Pokemon
//
//  Created by Furkan ic on 14.03.2024.
//

import Foundation


import Foundation

struct APIService {
    public func retrievePokemonList() async throws -> [PokemonDataModel] {
        try await URLSession().decode(from: .retrievePokemons())
    }
}
