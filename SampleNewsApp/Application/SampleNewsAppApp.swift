//
//  SampleNewsAppApp.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 30/01/24.
//

import SwiftUI

@main
struct SampleNewsAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(appDIContainer: AppDIContainer())
        }
    }
}
