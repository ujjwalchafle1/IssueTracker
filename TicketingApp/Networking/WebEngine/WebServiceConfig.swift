//
//  WebServiceConfig.swift
//  TicketingApp
//
//  Created by Ujjwal on 12/05/2021.
//

import Foundation

enum HTTPMethodType: String {
  case get = "GET"
}

protocol APIProtol {
  func methodType() -> HTTPMethodType
  func endPath() -> String
  func basePath() -> String
}

protocol  APIModelType{
  var api : APIProtol { get set }
  var parameters : [String:Any]? { get set }
}

struct APIRequestModel: APIModelType {
  var api: APIProtol
  var parameters: [String : Any]?
  
  init(api: APIProtol, param: [String:Any]? = nil){
    self.api = api
    self.parameters = param
  }
}

struct WebServiceHeader
{
  func generateHeader() -> [String: String] {
    var headers:[String: String] = [:]
    headers["Content-Type"] = "application/json"
    headers["Authorization"] = "Basic bW9iaWxldGVzdCthZ2VudEB6ZW5kZXNrLmNvbS90b2tlbjpCaHlaZzlQbUJwWU5KQlphRllPOGpyVW9SOVdUNFBWakN0SER1SzR4"
    return headers
  }
}

//request.setValue("Basic bW9iaWxldGVzdCthZ2VudEB6ZW5kZXNrLmNvbS90b2tlbjpCaHlaZzlQbUJwWU5KQlphRllPOGpyVW9SOVdUNFBWakN0SER1SzR4", forHTTPHeaderField: "Authorization")
