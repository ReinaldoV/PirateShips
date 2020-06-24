//
//  Ship.swift
//  PirateShips
//
//  Created by Reinaldo Villanueva Javierre on 23/06/2020.
//  Copyright © 2020 Reinaldo Villanueva Javierre. All rights reserved.
//

import Foundation

struct Ship: Equatable {
    let title: String?
    let description: String?
    let price: Int?
    let imageURL: URL?
    let greeting: PirateGreeting
}

enum PirateGreeting: String {
    case Ahoi = "Ahoi!"
    case Aye = "Aye Aye!"
    case Ar = "Arrr!"
    case Yo = "Yo ho hooo!"
}
