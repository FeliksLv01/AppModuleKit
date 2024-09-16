//
//  AppModuleCenter.swift
//  AppModule
//
//  Created by FeliksLv on 2023/2/19.
//

import Foundation

/// Manager Of Application Modules
public class AppModuleCenter: NSObject {
    public static let shared = AppModuleCenter()

    private var _modules: [AppModule] = []
    private var rwlock = pthread_rwlock_t()

    override init() {
        super.init()
        pthread_rwlock_init(&rwlock, nil)
    }

    deinit {
        pthread_rwlock_destroy(&rwlock)
    }

    /// add module to ModuleCenter，thread safety
    /// - Parameters:
    ///   - moduleClass: Class Type Adopt the AppModuleProtocol
    ///   - data: module init params
    public func addModule(_ moduleClass: AppModule.Type, data: [String: Any]? = nil) {
        pthread_rwlock_wrlock(&rwlock)
        defer { pthread_rwlock_unlock(&rwlock) }
        let module = moduleClass.init(with: data)
        _modules.append(module)
    }

    /// return all modules in AppModuleCenter，thread safety
    public var modules: [AppModule] {
        pthread_rwlock_rdlock(&rwlock)
        defer { pthread_rwlock_unlock(&rwlock) }
        return _modules
    }
}
