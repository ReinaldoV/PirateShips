//
//  ShipsServiceDTO.swift
//  PirateShips
//
//  Created by Reinaldo Villanueva Javierre on 23/06/2020.
//  Copyright © 2020 Reinaldo Villanueva Javierre. All rights reserved.
//

struct ShipsServiceDTO: Codable {
    let success: Bool
    let ships: [ShipDTO?]
}
