//
//  NewsRepository.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 05/02/24.
//

import Foundation

protocol NewsRepositoryProtocol {
    func fetchNews() async throws -> [NewsDomainDTO]
}

/// Repository class to provide data to Domain Layer
final class NewsRepository: NewsRepositoryProtocol {
    private let newsAPIWorker: NewsAPIWorkerProtocol

    init(newsAPIWorker: NewsAPIWorkerProtocol) {
        self.newsAPIWorker = newsAPIWorker
    }
    
    /// Fetch News
    /// - Returns: array of NewsDomainDTO
    func fetchNews() async throws -> [NewsDomainDTO] {
        do {
            let newsList = try await newsAPIWorker.fetchNews()
            return newsList.map { $0.domainDTO() }
        } catch {
            throw error
        }
    }
}
