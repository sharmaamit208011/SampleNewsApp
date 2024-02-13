//
//  NewsListFactory.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 07/02/24.
//

import Foundation

/// Purpose of this class is to provide objects
final class NewsListFactory {
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    /// Create News API Service object
    /// - Returns: object of class confirming NewsAPIWorkerProtocol
    private func createNewsAPIService() -> NewsAPIWorkerProtocol {
        NewsAPIWorker(networkClient: networkClient)
    }
    
    /// Create News Repository object
    /// - Returns: object of class confirming NewsRepositoryProtocol
    private func createNewsRepository() -> NewsRepositoryProtocol {
        NewsRepository(newsAPIWorker: createNewsAPIService())
    }
    
    /// Create News UseCase object
    /// - Returns: object of class confirming FetchNewsUseCaseProtocol
    private func createNewsUseCase() -> FetchNewsUseCaseProtocol {
        FetchNewsUseCase(newsRepository: createNewsRepository())
    }
    
    /// Create News View Model Object
    /// - Returns: NewsViewModel object
    private func createNewsViewModel() -> NewsViewModel {
        NewsViewModel(fetchNewsUseCase: createNewsUseCase())
    }
    
    /// Ceate NewsListNavigationView Object
    /// - Returns: NewsListNavigationView object
    func createNewsListNavigationView() -> NewsListNavigationView {
        NewsListNavigationView(newsViewModel: createNewsViewModel())
    }
}
