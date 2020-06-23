//
//  SelectionContracts.swift
//  PirateShips
//
//  Created by Reinaldo Villanueva Javierre on 23/06/2020.
//  Copyright © 2020 Reinaldo Villanueva Javierre. All rights reserved.
//

protocol SelectionPresenterProtocol: class {
    func retrieveData()
    func numberOfCells() -> Int
    func shipInfo(atIndex index: Int) -> Ship?
}

protocol SelectionViewControllerProtocol: class {
    func refreshTable()
    func startLoading()
    func stopLoading()
    func showMessage(_ message: String)
}
