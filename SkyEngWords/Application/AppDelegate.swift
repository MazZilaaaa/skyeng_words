//
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appConfigurator: AppConfigurator?
    func applicationDidFinishLaunching(_ application: UIApplication) {
        appConfigurator = AppConfigurator()
        window = appConfigurator?.configure()
    }

}
