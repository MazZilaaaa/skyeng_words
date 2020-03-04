//
//  SearchWordsViewTests.swift
//  SkyEngWords
//
//  Created by Alexandr on 04/03/2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import XCTest
@testable import SkyEngWords

final class SearchWordsViewTests: XCTestCase {

    // MARK: - Properties

    private var view: SearchWordsViewController?
    private var output: SearchWordsViewOutputMock?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        view = SearchWordsViewController()
        output = SearchWordsViewOutputMock()
        view?.output = output
    }

    override func tearDown() {
        super.tearDown()
        view = nil
        output = nil
    }

    // MARK: - Main tests

    // MARK: - Mocks

    private final class SearchWordsViewOutputMock: SearchWordsViewOutput {
    }

}
