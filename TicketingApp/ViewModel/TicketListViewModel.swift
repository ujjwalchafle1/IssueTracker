//
//  TicketListViewModel.swift
//  TicketingApp
//
//  Created by Ujjwal on 13/05/2021.
//

import Foundation


class TicketListViewModel : NSObject{
  
  var apiService: TicketListService!
  
  var tickets:[TicketElement]! {
    didSet{
      self.bindingListVMToController()
    }
  }
  
  var bindingListVMToController : (() -> ()) = {}
  
  init(service : TicketListService = TicketListService()) {
    super.init()
    self.apiService = service
    self.getLisitngs()
  }
  
  func getLisitngs()
  {
    let query = TicketAPIQueryParamModel(viewID: "360072851132", endPoint: "tickets.json")
    self.apiService.getLisitngs(queryModel: query, completion: { response in
      switch response {
      case .success(let data):
        self.tickets = data
      case .failure(let error):
        print(error)
      }
    })
  }
}
