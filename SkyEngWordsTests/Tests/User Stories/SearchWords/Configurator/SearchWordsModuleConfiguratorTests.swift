//
//  SearchWordsModuleConfiguratorTests.swift
//  SkyEngWords
//
//  Created by Alexandr on 04/03/2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import XCTest
@testable import SkyEngWords

final class SearchWordsModuleConfiguratorTests: XCTestCase {

	// MARK: - Main tests

    func testThatViewControllerLoadsCorrectly() {
        if UIStoryboard(name: String(describing: SearchWordsViewController.self),
                        bundle: Bundle.main).instantiateInitialViewController() == nil {
            XCTFail("Can't load SearchWordsViewController from storyboard, check that controller is initial view controller")
        }
    }

    func testThatScreenConfiguresCorrectly() {
        // when
        let viewController = SearchWordsModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "SearchWordsViewController is nil after configuration")
        XCTAssertTrue(viewController.output is SearchWordsPresenter, "output is not SearchWordsPresenter")

        guard let presenter: SearchWordsPresenter = viewController.output as? SearchWordsPresenter else {
            XCTFail("Cannot assign viewController.output as SearchWordsPresenter")
            return
        }

        XCTAssertNotNil(presenter.view, "view in SearchWordsPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in SearchWordsPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is SearchWordsRouter, "router is not SearchWordsRouter")

        guard let router: SearchWordsRouter = presenter.router as? SearchWordsRouter else {
            XCTFail("Cannot assign presenter.router as SearchWordsRouter")
            return
        }

        XCTAssertTrue(router.view is SearchWordsViewController, "view in router is not SearchWordsViewController")
    }

}
