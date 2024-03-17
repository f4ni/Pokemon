//
//  ViewModel.swift
//  Pokemon
//
//  Created by Furkan ic on 16.03.2024.
//

import Foundation
import Combine
import UIKit

final class ViewModel: ObservableObject {
    
    var pokemons: [PokemonDataModel]? = nil

    init() {}
    
    func getData(completion: @escaping ()->Void = {}) {
        guard pokemons == nil else { return completion() }
        Task.detached { @MainActor in
            self.pokemons = try await APIService().retrievePokemonList()
            completion()
        }
    }
}


