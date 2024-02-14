//
//  AppDIContainer.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 07/02/24.
//

import Foundation

/// App dependency injection container
final class AppDIContainer {
    lazy var newsListView: NewsListContainerView = {
        let newsListFactory = NewsListFactory(networkClient: ApiNetworkClient())
        return newsListFactory.createNewsListContainerView()
    }()
}
