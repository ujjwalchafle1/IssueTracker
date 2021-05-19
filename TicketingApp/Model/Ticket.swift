//
//  Ticket.swift
//  TicketingApp
//
//  Created by Ujjwal on 12/05/2021.
//

import Foundation

// MARK: - Ticket
struct Ticket: Codable {
    let tickets: [TicketElement]
}

// MARK: - TicketElement
struct TicketElement: Codable {
    let id: Int
    let subject, ticketDescription, status: String

    enum CodingKeys: String, CodingKey {
        case id, subject
        case ticketDescription = "description"
        case status
    }
}
