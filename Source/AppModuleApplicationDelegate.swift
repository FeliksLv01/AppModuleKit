//
//  AppModuleApplicationDelegate.swift
//  AppModule
//
//  Created by FeliksLv on 2023/2/19.
//

import Foundation

open class AppModuleApplicationDelegate: UIResponder, UIApplicationDelegate {
    @discardableResult
    open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        AppModuleCenter.shared.modules.forEach { module in
            let isSuccess = module.application?(application, didFinishLaunchingWithOptions: launchOptions) ?? true
            assert(isSuccess, "\(module) didFinishLaunchingWithOptions Start Error")
        }
        return true
    }
}
