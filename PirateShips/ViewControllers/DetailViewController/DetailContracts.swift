//
//  DetailContracts.swift
//  PirateShips
//
//  Created by Reinaldo Villanueva Javierre on 24/06/2020.
//  Copyright © 2020 Reinaldo Villanueva Javierre. All rights reserved.
//

import UIKit

protocol DetailPresenterProtocol: class {
    func image() -> UIImage
    func title() -> String
    func description() -> String
    func price() -> String
    func pirateGreeting() -> String
}
