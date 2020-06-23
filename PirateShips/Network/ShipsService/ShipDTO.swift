//
//  ShipDTO.swift
//  PirateShips
//
//  Created by Reinaldo Villanueva Javierre on 23/06/2020.
//  Copyright © 2020 Reinaldo Villanueva Javierre. All rights reserved.
//

import Foundation

struct ShipDTO: Codable {
    let id: Int?
    let title: String?
    let description: String?
    let price: Int?
    let imageURL: URL?
    let greetingType: PirateGreetingDTO?
}

enum PirateGreetingDTO: String, Codable {
    case Ahoi = "ah"
    case Aye = "ay"
    case Arrr = "ar"
    case Yo = "yo"

    func pirateGreeting() -> PirateGreeting {
        switch self {
        case .Ahoi:
            return .Ahoi
        case .Aye:
            return .Aye
        case .Arrr:
            return .Ar
        case .Yo:
            return .Yo
        }
    }
}
