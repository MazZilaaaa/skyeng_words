//
//  AppConfigurator.swift
//  SkyEngWords
//
//  Created by Alexandr on 04.03.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

final class AppConfigurator {
    func configure() -> UIWindow {
        let view = UINavigationController()
        let router = AppRouter()
        router.view = view
        router.showSearchMeaningsModule()
        let window = UIWindow()
        window.rootViewController = view
        window.makeKeyAndVisible()
        return window
    }
}
