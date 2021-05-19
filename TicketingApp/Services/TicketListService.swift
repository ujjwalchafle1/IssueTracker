//
//  TicketListService.swift
//  TicketingApp
//
//  Created by Ujjwal on 13/05/2021.
//

import Foundation


typealias getListingResponse = (Result<[TicketElement],Error>) -> Void

protocol ListingServiceRequestType {
  func getLisitngs(queryModel:TicketAPIQueryParamModel, completion: @escaping getListingResponse)
}

struct TicketListService: ListingServiceRequestType
{
  func getLisitngs(queryModel:TicketAPIQueryParamModel, completion: @escaping getListingResponse) {
    let api = APIRequestModel(api: TicketAPI.getTicketsService(queryModel))
    WebServiceHelper().requestAPI(apiModel: api) { response in
      switch response {
      case .success(let data):
        let response = ResponseDecoder()
        do {
          let decodedData = try response.decode(Ticket.self, data: data)
          completion(.success(decodedData!.tickets))
        } catch let error {
          print(error.localizedDescription)
        }
      case .failure( let error):
        print(error)
      }
    }
  }
  
}


