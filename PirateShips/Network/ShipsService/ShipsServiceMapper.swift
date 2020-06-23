//
//  ShipsServiceMapper.swift
//  PirateShips
//
//  Created by Reinaldo Villanueva Javierre on 23/06/2020.
//  Copyright © 2020 Reinaldo Villanueva Javierre. All rights reserved.
//


class ShipsServiceMapper {
    static func shipsFromShipsResponse(_ shipResponse: ShipsServiceDTO) -> [Ship] {
        var shipList = [Ship]()

        for shipData in shipResponse.ships where shipData != nil {
            let ship = Ship(title: shipData?.title,
                            description: shipData?.description,
                            price: shipData?.price,
                            imageURL: shipData?.image,
                            greeting: shipData?.greetingType?.pirateGreeting() ?? .Ahoi)
            shipList.append(ship)
        }
        return shipList
    }
}
