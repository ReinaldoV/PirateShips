//
//  SelectionPresenter.swift
//  PirateShips
//
//  Created by Reinaldo Villanueva Javierre on 23/06/2020.
//  Copyright © 2020 Reinaldo Villanueva Javierre. All rights reserved.
//

import Foundation

class SelectionPresenter {

    var ships = [Ship]()
    var service: ShipsService
    weak var selectionView: SelectionViewControllerProtocol?

    init(shipsService: ShipsService) {
        self.service = shipsService
    }
}

extension SelectionPresenter: SelectionPresenterProtocol {

    func numberOfCells() -> Int {
        return self.ships.count
    }

    func shipInfo(atIndex index: Int) -> Ship? {
        guard index < self.ships.count else { return nil }
        return self.ships[index]
    }

    func retrieveData() {
        self.service.getObjectives(onSuccess: { (ships) in
            DispatchQueue.main.async {
                self.ships = ships
                self.selectionView?.refreshTable()
            }
        }) { (error) in
            print(error?.localizedDescription as Any)
            if let errorMessage = error?.localizedDescription {
                DispatchQueue.main.async {
                    self.selectionView?.showMessage(errorMessage)
                }
            }
        }
    }
}
