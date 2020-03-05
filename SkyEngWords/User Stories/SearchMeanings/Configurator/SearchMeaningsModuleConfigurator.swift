//
//  SearchMeaningsModuleConfigurator.swift
//  SkyEngWords
//
//  Created by Alexandr on 04/03/2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit
import Moya

final class SearchMeaningsModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: SearchMeaningsModuleOutput? = nil) -> SearchMeaningsViewController {
        let view = SearchMeaningsViewController(nibName: "SearchMeaningsViewController", bundle: nil)
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
