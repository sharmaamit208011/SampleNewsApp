//
//  NewsAPIWorker.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 12/01/24.
//

import Foundation

protocol NewsAPIWorkerProtocol {
    func fetchNews() async throws -> [NewsDataDTO]
}

/// Purpose of this class to communicate Network layer to get data
final class NewsAPIWorker: NewsAPIWorkerProtocol {
    private let networkClient: NetworkClient
    private let newsAPIService: NetWorkService
    init(networkClient: NetworkClient, newsAPIService: NetWorkService = NewsAPIService()) {
        self.networkClient = networkClient
        self.newsAPIService = newsAPIService
    }
    
    func fetchNews() async throws -> [NewsDataDTO] {
        do {
            let newsList = try await networkClient.start(newsAPIService) as? NewsListDataModel
            return newsList?.articles ?? []
        } catch {
            throw error
        }
    }
}
