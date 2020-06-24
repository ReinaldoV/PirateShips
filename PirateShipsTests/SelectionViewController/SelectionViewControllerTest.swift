//
//  SelectionViewControllerTest.swift
//  PirateShipsTests
//
//  Created by Reinaldo Villanueva Javierre on 24/06/2020.
//  Copyright © 2020 Reinaldo Villanueva Javierre. All rights reserved.
//

import XCTest
@testable import PirateShips

class SelectionViewControllerTest: XCTestCase {

    var sut: SelectionViewController!
    var selectionPresenterMock: SelectionPresenterMock!

    override func setUp() {
        super.setUp()
        createSut()
    }

    override func tearDown() {
        releaseSut()
        super.tearDown()
    }

    func createSut() {
        sut = SelectionViewController()
        selectionPresenterMock = SelectionPresenterMock()
        sut.presenter = selectionPresenterMock
    }

    func releaseSut() {
        selectionPresenterMock = nil
        sut = nil
    }

    // MARK: - Basic test.
    func testSutIsntNil() {
        XCTAssertNotNil(sut, "Sut must not be nil.")
    }

    // MARK: - Test viewDidLoad
    func testLoadViewSuccess() {
        _ = sut.view
        sut.viewWillAppear(true)
        XCTAssertNotNil(sut.presenter, "Presenter must not be nil.")
        XCTAssertEqual(self.selectionPresenterMock.retrieveDataTimesCalled, 1)
    }
    
    func testRefreshTable() {
        sut.refreshTable()
        XCTAssertTrue(true)
    }
    
    func testShowMessage() {
        sut.showMessage("")
        XCTAssertTrue(true)
    }
}

// MARK: - SupportClasses
class SelectionPresenterMock: SelectionPresenterProtocol {
    var shipMock: Ship?
    var numberOfCellsMock = 0

    var retrieveDataTimesCalled = 0
    var numberOfCellsTimesCalled = 0

    func retrieveData() {
        retrieveDataTimesCalled += 1
    }

    func numberOfCells() -> Int {
        numberOfCellsTimesCalled += 1
        return numberOfCellsMock
    }

    func shipInfo(atIndex index: Int) -> Ship? {
        return self.shipMock
    }
}

