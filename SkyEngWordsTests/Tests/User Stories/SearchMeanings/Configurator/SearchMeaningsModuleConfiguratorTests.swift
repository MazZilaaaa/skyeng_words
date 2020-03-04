//
//  SearchMeaningsModuleConfiguratorTests.swift
//  SkyEngWords
//
//  Created by Alexandr on 04/03/2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import XCTest
@testable import SkyEngWords

final class SearchMeaningsModuleConfiguratorTests: XCTestCase {

	// MARK: - Main tests

    func testThatViewControllerLoadsCorrectly() {
        if UIStoryboard(name: String(describing: SearchMeaningsViewController.self),
                        bundle: Bundle.main).instantiateInitialViewController() == nil {
            XCTFail("Can't load SearchMeaningsViewController from storyboard, check that controller is initial view controller")
        }
    }

    func testThatScreenConfiguresCorrectly() {
        // when
        let viewController = SearchMeaningsModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "SearchMeaningsViewController is nil after configuration")
        XCTAssertTrue(viewController.output is SearchMeaningsPresenter, "output is not SearchMeaningsPresenter")

        guard let presenter: SearchMeaningsPresenter = viewController.output as? SearchMeaningsPresenter else {
            XCTFail("Cannot assign viewController.output as SearchMeaningsPresenter")
            return
        }

        XCTAssertNotNil(presenter.view, "view in SearchMeaningsPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in SearchMeaningsPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is SearchMeaningsRouter, "router is not SearchMeaningsRouter")

        guard let router: SearchMeaningsRouter = presenter.router as? SearchMeaningsRouter else {
            XCTFail("Cannot assign presenter.router as SearchMeaningsRouter")
            return
        }

        XCTAssertTrue(router.view is SearchMeaningsViewController, "view in router is not SearchMeaningsViewController")
    }

}
