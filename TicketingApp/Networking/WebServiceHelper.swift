//
//  WebServiceHelper.swift
//  TicketingApp
//
//  Created by Ujjwal on 12/05/2021.
//

import Foundation

enum NetworkError: Error {
    case incorrectData(Data)
    case incorrectURL
    case unknown
}

class WebServiceHelper
{
  
  typealias webServiceCompletionBlock = (Result<Data, Error>) -> Void

  func requestAPI(apiModel : APIModelType, completion: @escaping webServiceCompletionBlock)
  {
    
    guard let url = URL(string: apiModel.api.endPath(), relativeTo: URL(string: apiModel.api.basePath())) else {
      completion(.failure(NetworkError.incorrectURL))
      return
    }
    var request = URLRequest(url: url)
    request.httpMethod = apiModel.api.methodType().rawValue
    request.allHTTPHeaderFields = WebServiceHeader().generateHeader()
    
    if let param = apiModel.parameters {
      do {
          request.httpBody = try JSONSerialization.data(withJSONObject: param as Any, options: .prettyPrinted)
      } catch let error {
          print(error.localizedDescription)
      }
    }
    
    let sessionTask = URLSession.shared.dataTask(with: request) { data, response, error in
      
      guard let data = data, error == nil else {
        return completion(.failure(NetworkError.unknown))
      }
      
      if let httpStatus = response as? HTTPURLResponse,  ![200, 201].contains(httpStatus.statusCode) {
          completion(.failure(NetworkError.incorrectData(data)))
      }
      
      completion(.success(data))
    }
    sessionTask.resume()
  }
}
