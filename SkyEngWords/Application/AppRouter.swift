//
//  AppRouter.swift
//  SkyEngWords
//
//  Created by Alexandr on 04.03.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

final class AppRouter: AppRouterInput {
    weak var view: UINavigationController?
    func showSearchMeaningsModule() {
        let searchMeaningsConfigurator = SearchMeaningsModuleConfigurator()
        let searchMeaningsView = searchMeaningsConfigurator.configure()
        view?.viewControllers = [searchMeaningsView]
    }
}
