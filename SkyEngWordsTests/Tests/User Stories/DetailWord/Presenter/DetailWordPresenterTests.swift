//
//  DetailWordPresenterTests.swift
//  SkyEngWords
//
//  Created by Alexandr on 05/03/2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import XCTest
@testable import SkyEngWords

final class DetailWordPresenterTest: XCTestCase {

    // MARK: - Properties

    private var presenter: DetailWordPresenter?
    private var view: MockViewController?
    private var output: MockModuleOutput?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        presenter = DetailWordPresenter()
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

    private final class MockRouter: DetailWordRouterInput {
    }

    private final class MockViewController: DetailWordViewInput {
    }

    private final class MockModuleOutput: DetailWordModuleOutput {
    }

}
