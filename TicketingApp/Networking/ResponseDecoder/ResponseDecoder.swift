//
//  ResponseDecoder.swift
//  TicketingApp
//
//  Created by Ujjwal on 13/05/2021.
//

import Foundation

/// JSON decoder to parse and create the response model using JSONDecoder
struct ResponseDecoder
{
  /// Function to create the JSONDecoder instance and use Codable objects to encode and decode api json response
  /// - Parameters:
  ///   - type: Response Model of generic type
  ///   - data: json data
  /// - Throws: error while parsing
  /// - Returns: Response Model
  public func decode<T: Codable>(_ type: T.Type, data: Data) throws -> T?
  {
    let jsonDecoder = JSONDecoder()
    do {
      let response = try jsonDecoder.decode(T.self, from: data)
      return response
    } catch let error {
      throw error
    }
  }
}
