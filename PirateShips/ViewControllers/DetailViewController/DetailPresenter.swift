//
//  DetailPresenter.swift
//  PirateShips
//
//  Created by Reinaldo Villanueva Javierre on 24/06/2020.
//  Copyright © 2020 Reinaldo Villanueva Javierre. All rights reserved.
//

import UIKit

class DetailPresenter {

    let ship: Ship
    let loadedImage: UIImage?

    init(ship: Ship, imageAlreadyLoaded: UIImage?) {
        self.ship = ship
        self.loadedImage = imageAlreadyLoaded
    }
}

extension DetailPresenter: DetailPresenterProtocol {

    func image() -> UIImage {
        if let image = loadedImage {
            return image
        }
        return UIImage(named: "placeHolderShip") ?? UIImage()
    }

    func title() -> String {
        return self.ship.title ?? ""
    }

    func description() -> String {
        self.ship.description ?? ""
    }

    func price() -> String {
        self.ship.price?.description ?? ""
    }
}
