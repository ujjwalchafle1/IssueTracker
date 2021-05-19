//
//  TicketListCell.swift
//  TicketingApp
//
//  Created by Ujjwal on 13/05/2021.
//

import UIKit

class TicketListCell: UITableViewCell
{
  @IBOutlet weak var ticketIDLbl: UILabel!
  @IBOutlet weak var ticketStatus: UILabel!
  @IBOutlet weak var subjectLbl: UILabel!
  @IBOutlet weak var descriptionLbl: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  func setupCell(_ ticket: TicketElement)
  {
    self.ticketIDLbl?.text = "Ticket ID: \(ticket.id)"
    self.ticketStatus?.text = "Status: \(ticket.status.capitalized)"
    self.subjectLbl?.text = ticket.subject
    self.descriptionLbl?.text = ticket.ticketDescription
  }

}
