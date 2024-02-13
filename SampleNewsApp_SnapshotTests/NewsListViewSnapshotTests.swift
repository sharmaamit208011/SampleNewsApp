//
//  SampleNewsApp_SnapshotTests.swift
//  SampleNewsApp_SnapshotTests
//
//  Created by Amit Sharma on 08/02/24.
//

import XCTest
import SnapshotTesting
import SwiftUI

@testable import SampleNewsApp

final class NewsListViewSnapshotTests: XCTestCase {
    var mockFetchNewsUseCase: MockFetchNewsUseCase?
    var viewModel: NewsViewModel?
    var newsDetailviewModel :NewsDetailViewModel?
    
    override func setUp() {
        super.setUp()
        
        mockFetchNewsUseCase = MockFetchNewsUseCase()
        viewModel = NewsViewModel(fetchNewsUseCase: mockFetchNewsUseCase ?? MockFetchNewsUseCase())
    }
    
    override func tearDown() {
        super.tearDown()
        
        mockFetchNewsUseCase = nil
        viewModel = nil
    }
    
    func testSuccessAppearance() {
        viewModel?.newsList = MockData.newsList
        if let viewModel = viewModel {
            let contentView = NewsListNavigationView(newsViewModel: viewModel)
            let viewController = contentView.toViewController()
            viewController.performSnapshotTests(named: "NewsListView_Success")
        }
    }
    
    func testSuccessNewsDetailAppearance() {
        viewModel?.newsList = MockData.newsList
        if let news = viewModel?.newsList.first {
            newsDetailviewModel = NewsDetailViewModel(news: news)
        }
        
        if let viewModel = viewModel, let newsDetailviewModel = newsDetailviewModel {
            let contentView = NewsDetailView(viewModel: newsDetailviewModel)
            let viewController = contentView.toViewController()
            viewController.performSnapshotTests(named: "NewsDetailView_Success")
        }
    }
}

extension View {
    func toViewController() -> UIViewController {
        let viewController = UIHostingController(rootView: self)
        viewController.view.frame = UIScreen.main.bounds
        return viewController
    }
}

extension UIViewController {
    func performSnapshotTests(
        named name: String,
        precision: Float = 0.99,
        testName: String = "Snapshot") {
            assertSnapshot(
                matching: self,
                as: .image(precision: precision),
                named: name,
                testName: testName)
        }
}
