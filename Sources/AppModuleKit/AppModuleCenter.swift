//
//  AppModuleCenter.swift
//  AppModuleKit
//
//  Created by FeliksLv on 2025/1/4.
//

import Foundation

/// Manager of Application Modules
@MainActor
public final class AppModuleCenter {
    public static let shared = AppModuleCenter()

    public private(set) var modules: [AppModule] = []

    /// Register module to ModuleCenter, thread safety
    /// - Parameter moduleClass: Class Type adopting the AppModule Protocol
    public func register(_ moduleClass: AppModule.Type) {
        let module = (moduleClass as! NSObject.Type).init()
        modules.append(module as! AppModule)
    }
}
