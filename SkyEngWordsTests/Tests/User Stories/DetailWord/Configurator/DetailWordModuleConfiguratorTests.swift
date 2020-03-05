//
//  DetailWordModuleConfiguratorTests.swift
//  SkyEngWords
//
//  Created by Alexandr on 05/03/2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import XCTest
@testable import SkyEngWords

final class DetailWordModuleConfiguratorTests: XCTestCase {

	// MARK: - Main tests

    func testThatViewControllerLoadsCorrectly() {
        if UIStoryboard(name: String(describing: DetailWordViewController.self),
                        bundle: Bundle.main).instantiateInitialViewController() == nil {
            XCTFail("Can't load DetailWordViewController from storyboard, check that controller is initial view controller")
        }
    }

    func testThatScreenConfiguresCorrectly() {
        // when
        let viewController = DetailWordModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "DetailWordViewController is nil after configuration")
        XCTAssertTrue(viewController.output is DetailWordPresenter, "output is not DetailWordPresenter")

        guard let presenter: DetailWordPresenter = viewController.output as? DetailWordPresenter else {
            XCTFail("Cannot assign viewController.output as DetailWordPresenter")
            return
        }

        XCTAssertNotNil(presenter.view, "view in DetailWordPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in DetailWordPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is DetailWordRouter, "router is not DetailWordRouter")

        guard let router: DetailWordRouter = presenter.router as? DetailWordRouter else {
            XCTFail("Cannot assign presenter.router as DetailWordRouter")
            return
        }

        XCTAssertTrue(router.view is DetailWordViewController, "view in router is not DetailWordViewController")
    }

}
