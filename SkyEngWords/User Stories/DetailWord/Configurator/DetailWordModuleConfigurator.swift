//
//  DetailWordModuleConfigurator.swift
//  SkyEngWords
//
//  Created by Alexandr on 05/03/2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

final class DetailWordModuleConfigurator {

    // MARK: - Internal methods

    func configure(with word: Word) -> DetailWordViewController {
        let view = DetailWordViewController(nibName: "DetailWordViewController", bundle: nil)
        let presenter = DetailWordPresenter(word: word)
        let router = DetailWordRouter()

        presenter.view = view
        presenter.router = router
        router.view = view
        view.output = presenter

        return view
    }

}
