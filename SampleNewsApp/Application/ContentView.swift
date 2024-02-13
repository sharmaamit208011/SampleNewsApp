//
//  ContentView.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 30/01/24.
//

import SwiftUI

struct ContentView: View {
    let appDIContainer: AppDIContainer
    
    var body: some View {
        appDIContainer.newsListView
    }
}
