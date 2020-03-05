//
//  DetailWordRouterTests.swift
//  SkyEngWords
//
//  Created by Alexandr on 05/03/2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import XCTest
@testable import SkyEngWords

final class DetailWordRouterTests: XCTestCase {

	// MARK: - Properties

    private var view: MockModuleTransitionable?
    private var router: DetailWordRouter?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        router = DetailWordRouter()
        view = MockModuleTransitionable()
        router?.view = view
    }

    override func tearDown() {
        super.tearDown()
        view = nil
        router = nil
    }

    // MARK: - Main tests

    // MARK: - Mocks

    private final class MockModuleTransitionable: ModuleTransitionable {

        func showModule(_ module: UIViewController) {
        }

        func dismissView(animated: Bool, completion: (() -> Void)?) {
        }

        func presentModule(_ module: UIViewController, animated: Bool, completion: (() -> Void)?) {
        }

        func pop(animated: Bool) {
        }

        func push(module: UIViewController, animated: Bool) {
        }

        func push(module: UIViewController, animated: Bool, hideTabBar: Bool) {
        }

    }

}
