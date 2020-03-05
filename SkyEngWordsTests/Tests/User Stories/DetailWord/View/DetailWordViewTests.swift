//
//  DetailWordViewTests.swift
//  SkyEngWords
//
//  Created by Alexandr on 05/03/2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import XCTest
@testable import SkyEngWords

final class DetailWordViewTests: XCTestCase {

    // MARK: - Properties

    private var view: DetailWordViewController?
    private var output: DetailWordViewOutputMock?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        view = DetailWordViewController()
        output = DetailWordViewOutputMock()
        view?.output = output
    }

    override func tearDown() {
        super.tearDown()
        view = nil
        output = nil
    }

    // MARK: - Main tests

    // MARK: - Mocks

    private final class DetailWordViewOutputMock: DetailWordViewOutput {
        func viewLoaded() {
        }
    }

}
