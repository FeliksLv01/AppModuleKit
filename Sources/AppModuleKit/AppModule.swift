//
//  AppModule.swift
//  AppModuleKit
//
//  Created by FeliksLv on 2025/1/4.
//

import UIKit

@objc
@MainActor
public protocol AppModule: NSObjectProtocol {
    @objc
    optional func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool
}

@MainActor
open class AppModuleApplicationDelegate: UIResponder, UIApplicationDelegate {
    @discardableResult
    open func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        AppModuleCenter.shared.modules.forEach { module in
            let isSuccess =
                module.application?(application, didFinishLaunchingWithOptions: launchOptions)
                ?? true
            assert(isSuccess, "\(module) didFinishLaunchingWithOptions Return False")
        }
        return true
    }
}
