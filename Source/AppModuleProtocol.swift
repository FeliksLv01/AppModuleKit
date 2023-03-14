//
//  AppModuleProtocol.swift
//  AppModule
//
//  Created by FeliksLv on 2023/2/19.
//

import Foundation

public protocol AppModuleProtocol: UIApplicationDelegate {
    init(with data: [String: Any]?)
}
