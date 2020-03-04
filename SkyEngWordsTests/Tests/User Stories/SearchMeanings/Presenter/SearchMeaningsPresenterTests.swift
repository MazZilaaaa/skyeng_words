//
//  SearchMeaningsPresenterTests.swift
//  SkyEngWords
//
//  Created by Alexandr on 04/03/2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import XCTest
@testable import SkyEngWords

final class SearchMeaningsPresenterTest: XCTestCase {

    // MARK: - Properties

    private var presenter: SearchMeaningsPresenter?
    private var view: MockViewController?
    private var output: MockModuleOutput?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        presenter = SearchMeaningsPresenter()
        presenter?.router = MockRouter()
        view = MockViewController()
        presenter?.view = view
        output = MockModuleOutput()
        presenter?.output = output
    }

    override func tearDown() {
        super.tearDown()
        presenter = nil
        view = nil
    }

    // MARK: - Main tests

    // MARK: - Mocks

    private final class MockRouter: SearchMeaningsRouterInput {
    }

    private final class MockViewController: SearchMeaningsViewInput {
    }

    private final class MockModuleOutput: SearchMeaningsModuleOutput {
    }

}
