//
//  ViewController.swift
//  TicketingApp
//
//  Created by Ujjwal on 12/05/2021.
//

import UIKit

class ViewController: UIViewController {
  
  var dataSource: [TicketElement] = []
  
  @IBOutlet weak var table: UITableView!
  
  var ticketListVM: TicketListViewModel!

  override func viewDidLoad() {
    super.viewDidLoad()
    callToViewModelForUIUpdate()
  }

  func callToViewModelForUIUpdate()
  {
    self.ticketListVM = TicketListViewModel()
    self.ticketListVM.bindingListVMToController = {
      DispatchQueue.main.async {
        self.dataSource = self.ticketListVM.tickets
        self.table.reloadData()
      }
    }
  }
}

extension ViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.dataSource.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell =  tableView.dequeueReusableCell(withIdentifier: "ticket_Cell") as? TicketListCell
    cell?.setupCell(self.dataSource[indexPath.row])
    return cell!
  }

}
