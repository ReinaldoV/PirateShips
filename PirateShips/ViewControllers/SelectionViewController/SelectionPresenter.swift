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
        self.selectionView?.startLoading()
        self.service.getObjectives(onSuccess: { (ships) in
            self.ships = ships
            self.selectionView?.stopLoading()
            self.selectionView?.refreshTable()
        }) { (error) in
            print(error?.localizedDescription as Any)
            if let errorMessage = error?.localizedDescription {
                self.selectionView?.showMessage(errorMessage)
            }
        }
    }
}