//
//  AppModuleCenter.swift
//  AppModule
//
//  Created by FeliksLv on 2023/2/19.
//

import Foundation

/// Manager Of Application Modules
public class AppModuleCenter {
    public static let shared = AppModuleCenter()

    private var rwlock = pthread_rwlock_t()
    private var _modules: [AppModule] = []
    public var modules: [AppModule] {
        pthread_rwlock_rdlock(&rwlock)
        defer { pthread_rwlock_unlock(&rwlock) }
        return _modules
    }

    init() {
        pthread_rwlock_init(&rwlock, nil)
    }

    deinit {
        pthread_rwlock_destroy(&rwlock)
    }

    /// register module to ModuleCenter，thread safety
    /// - Parameters:
    ///   - moduleClass: Class Type Adopt the AppModuleProtocol
    ///   - data: module init params
    public func register(_ moduleClass: AppModule.Type) {
        pthread_rwlock_wrlock(&rwlock)
        defer { pthread_rwlock_unlock(&rwlock) }
        let module = (moduleClass as! NSObject.Type).init()
        _modules.append(module as! AppModule)
    }

    public static func autoRegister() {
        let beginRegisterTime = CFAbsoluteTimeGetCurrent()
        let bundle = CFBundleGetMainBundle()
        guard let execURL = CFBundleCopyExecutableURL(bundle) as NSURL? else {
            return
        }
        let imageURL = execURL.fileSystemRepresentation

        let classCount = UnsafeMutablePointer<UInt32>.allocate(capacity: MemoryLayout<UInt32>.stride)
        // Xcode 16 默认开启ENABLE_DEBUG_DYLIB，会导致objc_copyClassNamesForImage 主工程 image 调用失败
        // https://github.com/HuolalaTech/hll-wp-therouter-ios/issues/59
        if let classNames = objc_copyClassNamesForImage(imageURL, classCount) {
            for idx in 0 ..< classCount.pointee {
                let currentClassName = String(cString: classNames[Int(idx)])
                guard let currentClass = NSClassFromString(currentClassName) else {
                    continue
                }

                if class_getInstanceMethod(currentClass, NSSelectorFromString("methodSignatureForSelector:")) != nil,
                   class_getInstanceMethod(currentClass, NSSelectorFromString("doesNotRecognizeSelector:")) != nil,
                   let cls = currentClass as? AppModule.Type
                {
                    AppModuleCenter.shared.register(cls)
                }
            }
        }

        let endRegisterTime = CFAbsoluteTimeGetCurrent()
        print("服务注册耗时：\(endRegisterTime - beginRegisterTime)")
    }
}
