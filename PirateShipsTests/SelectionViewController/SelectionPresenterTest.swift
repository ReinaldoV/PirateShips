//
//  SelectionPresenterTest.swift
//  PirateShipsTests
//
//  Created by Reinaldo Villanueva Javierre on 24/06/2020.
//  Copyright © 2020 Reinaldo Villanueva Javierre. All rights reserved.
//

import XCTest
@testable import PirateShips

class SelectionPresenterTest: XCTestCase {

    var sut: SelectionPresenter!
    var selectionViewControllerMock: SelectionViewControllerMock!
    var serviceMock: ShipsServiceMock!

    override func setUp() {
        super.setUp()
        createSut()
    }

    override func tearDown() {
        releaseSut()
        super.tearDown()
    }

    func createSut() {
        serviceMock = ShipsServiceMock()
        selectionViewControllerMock = SelectionViewControllerMock()
        sut = SelectionPresenter(shipsService: serviceMock)
        sut.selectionView = selectionViewControllerMock
    }

    func releaseSut() {
        serviceMock = nil
        selectionViewControllerMock = nil
        sut = nil
    }

    // MARK: - Basic test.
    func testSutIsntNil() {
        XCTAssertNotNil(sut, "Sut must not be nil.")
    }

    // MARK: - testNumberOfCells
    func testNumberOfCells() {
        let result = sut.numberOfCells()
        let expected = 0
        XCTAssertEqual(result, expected)
    }

    // MARK: - testShipInfo
    func testReturnCorrectShip() {
        let ship = Ship(title: nil, description: nil, price: nil, imageURL: nil, greeting: .Ahoi)
        sut.ships = [ship]

        let expected = sut.shipInfo(atIndex: 0)

        XCTAssertEqual(expected, ship)
    }

    func testNegativeIndex() {
        let expected = sut.shipInfo(atIndex: -789)

        XCTAssertNil(expected)
    }

    func testIncorrectIndex() {
        let ship = Ship(title: nil, description: nil, price: nil, imageURL: nil, greeting: .Ahoi)
        sut.ships = [ship]

        let expected = sut.shipInfo(atIndex: 1)

        XCTAssertNil(expected)
    }

    // MARK: - testRetrieveData
    func testRetrieveData() {
        sut.retrieveData()

        XCTAssertEqual(self.serviceMock.getShipsTimesCalled, 1)
    }
}

// MARK: - SupportClasses
class SelectionViewControllerMock: SelectionViewControllerProtocol {

    var refreshTableTimesCalled = 0
    var showMessageTimesCalled = 0

    func refreshTable() {
        refreshTableTimesCalled += 1
    }

    func showMessage(_ message: String) {
        showMessageTimesCalled += 1
    }
}

class ShipsServiceMock: ShipsService {
    var ships = [Ship]()

    var getShipsTimesCalled = 0

    override func getShips(onSuccess: @escaping ([Ship]) -> Void,
                           onError: @escaping (Error?) -> Void) {
        getShipsTimesCalled += 1
        onSuccess(self.ships)
        onError(nil)
    }
}

