//
//  APIRouter.swift
//  Pokemon
//
//  Created by Furkan ic on 14.03.2024.
//

import Foundation

enum APIRouter {
   case pokemon
   
   var baseUrl: String {
      "https://gist.githubusercontent.com"
   }
   
   var path: String {
      switch self {
      case .pokemon:
         return "/DavidCorrado/8912aa29d7c4a5fbf03993b32916d601/raw/681ef0b793ab444f2d81f04f605037fb44814125/pokemon.json"
      }
   }
   
   var apiUrl: String {
      baseUrl + path
   }
}

extension Request where Response == [PokemonDataModel] {
   static func retrievePokemons() -> Self {
      return Request(url: URL(string: APIRouter.pokemon.apiUrl)!, method: .get([]))
   }
}
