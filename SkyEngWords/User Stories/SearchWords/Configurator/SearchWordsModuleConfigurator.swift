//
//  SearchWordsModuleConfigurator.swift
//  SkyEngWords
//
//  Created by Alexandr on 04/03/2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

final class SearchWordsModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: SearchWordsModuleOutput? = nil) -> SearchWordsViewController {
        guard let view = UIStoryboard(name: String(describing: SearchWordsViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? SearchWordsViewController else {
            fatalError("Can't load SearchWordsViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = SearchWordsPresenter()
        let router = SearchWordsRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
