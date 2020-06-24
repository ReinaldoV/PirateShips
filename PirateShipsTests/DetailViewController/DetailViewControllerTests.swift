//
//  DetailViewControllerTests.swift
//  PirateShipsTests
//
//  Created by Reinaldo Villanueva Javierre on 24/06/2020.
//  Copyright © 2020 Reinaldo Villanueva Javierre. All rights reserved.
//

import XCTest
@testable import PirateShips

class DetailViewControllerTests: XCTestCase {

    var sut: DetailViewController!

    override func setUp() {
        super.setUp()
        createSut()
    }

    override func tearDown() {
        releaseSut()
        super.tearDown()
    }

    func createSut() {
        sut = DetailViewController()
    }

    func releaseSut() {
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
    }
}
