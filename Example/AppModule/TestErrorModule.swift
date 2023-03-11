//
//  TestErrorModule.swift
//  AppModule_Example
//
//  Created by FeliksLv on 2023/2/19.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import AppModule

class TestErrorModule: NSObject, AppModuleProtocol {
    required init(with data: [String : Any]?) {
        super.init()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        print("load TestErrorModel")
        return true
    }
}
