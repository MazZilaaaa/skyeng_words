//
//  SearchMeaningsRouter.swift
//  SkyEngWords
//
//  Created by Alexandr on 04/03/2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

final class SearchMeaningsRouter: SearchMeaningsRouterInput {

	// MARK: - Properties

    weak var view: ModuleTransitionable?

    func showDetailWordModule(with word: Word) {
        let detailWordConfigurator = DetailWordModuleConfigurator()
        let detailWordView = detailWordConfigurator.configure(with: word)
        view?.push(module: detailWordView, animated: true)
    }

    func showMessageModule(with message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        view?.presentModule(alertController, animated: true, completion: nil)
    }
}
