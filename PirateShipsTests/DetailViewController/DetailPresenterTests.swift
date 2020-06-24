//
//  DetailPresenterTests.swift
//  PirateShipsTests
//
//  Created by Reinaldo Villanueva Javierre on 24/06/2020.
//  Copyright © 2020 Reinaldo Villanueva Javierre. All rights reserved.
//

import XCTest
@testable import PirateShips

class DetailPresenterTests: XCTestCase {

    var sut: DetailPresenter!
    var ship: Ship!

    override func setUp() {
        super.setUp()
        createSut()
    }

    override func tearDown() {
        releaseSut()
        super.tearDown()
    }

    func createSut() {
        ship = Ship(title: nil, description: nil, price: nil, imageURL: nil, greeting: .Ahoi)
        sut = DetailPresenter(ship: ship, imageAlreadyLoaded: nil)
    }

    func releaseSut() {
        sut = nil
    }

    // MARK: - Basic test.
    func testSutIsntNil() {
        XCTAssertNotNil(sut, "Sut must not be nil.")
    }

    // MARK: - Test image
    func testNoImage() {
        let result = sut.image()
        XCTAssertNotNil(result)
    }

    func testImageAlreadyLoaded() {
        let imageLoaded = UIImage()
        sut = DetailPresenter(ship: self.ship, imageAlreadyLoaded: imageLoaded)
        let result = sut.image()
        XCTAssertNotNil(result)
        XCTAssertEqual(imageLoaded, result)
    }

    // MARK: - Test title
    func testTitleEmptyWhenNil() {
        let result = sut.title()

        XCTAssertNotNil(result)
        XCTAssertTrue(result.isEmpty)
    }

    func testTitle() {
        let expected = "expected"
        ship = Ship(title: expected, description: nil, price: nil, imageURL: nil, greeting: .Ahoi)
        sut = DetailPresenter(ship: ship, imageAlreadyLoaded: nil)

        let result = sut.title()

        XCTAssertNotNil(result)
        XCTAssertEqual(expected, result)
    }

    // MARK: - Test description
    func testDescriptionEmptyWhenNil() {
        let result = sut.description()

        XCTAssertNotNil(result)
        XCTAssertTrue(result.isEmpty)
    }

    func testDescription() {
        let expected = "expected"
        ship = Ship(title: nil, description: expected, price: nil, imageURL: nil, greeting: .Ahoi)
        sut = DetailPresenter(ship: ship, imageAlreadyLoaded: nil)

        let result = sut.description()

        XCTAssertNotNil(result)
        XCTAssertEqual(expected, result)
    }

    // MARK: - Test price
    func testPriceEmptyWhenNil() {
        let result = sut.price()

        XCTAssertNotNil(result)
        XCTAssertTrue(result.isEmpty)
    }

    func testPrice() {
        ship = Ship(title: nil, description: nil, price: 0, imageURL: nil, greeting: .Ahoi)
        sut = DetailPresenter(ship: ship, imageAlreadyLoaded: nil)

        let result = sut.price()

        XCTAssertNotNil(result)
        XCTAssertFalse(result.isEmpty)
    }

    // MARK: - Test pirateGreeting
    func testPirateGreeting() {
        let expected = PirateGreeting.Ahoi.rawValue

        let result = sut.pirateGreeting()

        XCTAssertNotNil(result)
        XCTAssertFalse(result.isEmpty)
        XCTAssertEqual(result, expected)
    }
}
