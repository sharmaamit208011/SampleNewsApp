//
//  Environment.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 12/01/24.
//

import Foundation

/// Environment to set Base Url, version and API Key
protocol Environment {
    var baseURL: String { get set }
    var version: String { get set }
    var ApiKey: String  { get set }
    
}

extension Environment {
    var baseURL: String {
        get {
            APIConfig.defaultbaseURL
        } set {
            baseURL = newValue
        }
    }
    
    var version: String {
        get {
            APIConfig.defaultVersion
        } set {
            version = newValue
        }
    }
    
    var ApiKey: String {
        get {
            APIConfig.defaultAPIKey
        } set {
            ApiKey = newValue
        }
    }
}
