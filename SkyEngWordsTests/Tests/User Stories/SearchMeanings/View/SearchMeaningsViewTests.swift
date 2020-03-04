//
//  SearchMeaningsViewTests.swift
//  SkyEngWords
//
//  Created by Alexandr on 04/03/2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import XCTest
@testable import SkyEngWords

final class SearchMeaningsViewTests: XCTestCase {

    // MARK: - Properties

    private var view: SearchMeaningsViewController?
    private var output: SearchMeaningsViewOutputMock?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        view = SearchMeaningsViewController()
        output = SearchMeaningsViewOutputMock()
        view?.output = output
    }

    override func tearDown() {
        super.tearDown()
        view = nil
        output = nil
    }

    // MARK: - Main tests

    // MARK: - Mocks

    private final class SearchMeaningsViewOutputMock: SearchMeaningsViewOutput {
    }

}
