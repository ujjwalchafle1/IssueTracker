//
//  TicketServices.swift
//  TicketingApp
//
//  Created by Ujjwal on 13/05/2021.
//

import Foundation

struct TicketAPIQueryParamModel {
    let viewID: String
    let endPoint: String
}

enum TicketAPI {
  case getTicketsService(TicketAPIQueryParamModel)
}

extension TicketAPI: APIProtol
{
  
  func methodType() -> HTTPMethodType {
    var method = HTTPMethodType.get
    switch self {
    case .getTicketsService(_):
      method = .get
    }
    return method
  }
  
  func endPath() -> String {
    var endPath = ""
    switch self {
    case .getTicketsService(let queryModel):
      endPath += WebserviceConstants.ticketListAPI + queryModel.viewID + "/" + queryModel.endPoint
    }
    return endPath
  }
  
  func basePath() -> String {
    switch self {
    case .getTicketsService(_):
      return WebserviceConstants.baseURL
    }
  }
}
