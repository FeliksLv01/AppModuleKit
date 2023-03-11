//
//  AppDelegate.swift
//  AppModule
//
//  Created by felikslv on 02/19/2023.
//  Copyright (c) 2023 felikslv. All rights reserved.
//

import AppModule
import UIKit

@UIApplicationMain
class AppDelegate: AppModuleApplicationDelegate {
    var window: UIWindow?

    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        AppModuleCenter.shared.addModule(TestModule.self)
        AppModuleCenter.shared.addModule(TestErrorModule.self)

        super.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
}
