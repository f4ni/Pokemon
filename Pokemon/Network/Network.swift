//
//  Network.swift
//  Pokemon
//
//  Created by Furkan ic on 15.03.2024.
//

import Foundation
import Combine

public struct Request<Response> {
   let url: URL
   let method: HttpMethod
   var headers: [String: String] = [:]
}

enum HttpMethod: Equatable {
   case get([URLQueryItem])
   case put(Data?)
   case post(Data?)
   case delete
   case head
   
   var name: String {
      switch self {
      case .get: return "GET"
      case .put: return "PUT"
      case .post: return "POST"
      case .delete: return "DELETE"
      case .head: return "HEAD"
      }
   }
}

extension Request {
   var urlRequest: URLRequest {
      var request = URLRequest(url: url)
      
      switch method {
      case .post(let data), .put(let data):
         request.httpBody = data
      case let .get(queryItems):
         var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
         components?.queryItems = queryItems
         guard let url = components?.url else {
            preconditionFailure("Couldn't create a url from components...")
         }
         request = URLRequest(url: url)
      default:
         break
      }
      
      request.allHTTPHeaderFields = headers
      request.httpMethod = method.name
      return request
   }
}

extension URLSession {
    
   public func decode<Value: Decodable>(
      from request: Request<Value>,
      using decoder: JSONDecoder = .init()
   ) async throws -> Value {
      let decoded: Task<Value, Swift.Error> = .detached(priority: .userInitiated) {
          let (data, response) = try await URLSession.shared.data(for: request.urlRequest)
         try Task.checkCancellation()
         return try decoder.decode(Value.self, from: data)
      }
      return try await decoded.value
   }
}

