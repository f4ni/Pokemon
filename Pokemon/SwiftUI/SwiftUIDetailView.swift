//
//  SwiftUIDetailView.swift
//  Pokemon
//
//  Created by Furkan ic on 18.03.2024.
//

import SwiftUI
import Kingfisher

struct SwiftUIDetailView: View {
    var pokemon: PokemonDataModel?
    
    init(pokemon: PokemonDataModel? = nil) {
        self.pokemon = pokemon
    }
    
    var body: some View {
        VStack {
            if let url = URL(string: pokemon?.imageUrl ?? "") {
                KFImage(url)
            }
            if let description = pokemon?.description {
                Text(description)
            }
            Spacer()
        }
        .padding(24)
    }
}

#Preview {
    SwiftUIDetailView()
}
