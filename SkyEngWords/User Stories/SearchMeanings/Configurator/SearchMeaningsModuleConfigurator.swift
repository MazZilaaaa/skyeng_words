//
//  SearchMeaningsModuleConfigurator.swift
//  SkyEngWords
//
//  Created by Alexandr on 04/03/2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

final class SearchMeaningsModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: SearchMeaningsModuleOutput? = nil) -> SearchMeaningsViewController {
        guard let view = UIStoryboard(name: String(describing: SearchMeaningsViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? SearchMeaningsViewController else {
            fatalError("Can't load SearchMeaningsViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = SearchMeaningsPresenter()
        let router = SearchMeaningsRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
