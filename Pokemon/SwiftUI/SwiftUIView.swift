//
//  SwiftUIView.swift
//  Pokemon
//
//  Created by Furkan ic on 17.03.2024.
//

import SwiftUI
import Kingfisher

struct SwiftUIView: View {
    
    let viewModel: ViewModel?
    
    @State var pokemonToPresent: PokemonDataModel? = nil
    
    init(viewModel: ViewModel? = nil) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            if let pokemons = viewModel?.pokemons {
                List(pokemons) { pokemon in
                    Button {
                        pokemonToPresent = pokemon
                    } label: {
                        PokemonListItemView(pokemon: pokemon)
                    }
                    .buttonStyle(.plain)
                }
                
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle("Pokemons(SwiftUI)")
        .sheet(item: $pokemonToPresent) { pokemon in
            SwiftUIDetailView(pokemon: pokemon)
        }
    }
}

struct PokemonListItemView: View {
    let pokemon: PokemonDataModel
    
    init(pokemon: PokemonDataModel) {
        self.pokemon = pokemon
    }
    
    var body: some View {
        HStack(spacing: 0) {
            if let url = URL(string: pokemon.imageUrl ?? "") {
                KFImage(url)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .imageScale(.large)
                    .frame(width: 84, height: 84)
                    .padding(0)
            }
            
            VStack(alignment: .leading) {
                if let name = pokemon.name {
                    Text(name)
                        .font(.headline)
                }
                if let description = pokemon.description {
                    Text(description)
                        .font(.caption)
                }
            }
            .padding(12)
        }
        .padding(0)
    }
}

#Preview {
    SwiftUIView()
}
