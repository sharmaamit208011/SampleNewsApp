//
//  FetchNewsUseCase.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 05/02/24.
//

import Foundation

protocol FetchNewsUseCaseProtocol {
    func execute() async throws -> [News]
}

/// Use case to fetch News 
final class FetchNewsUseCase: FetchNewsUseCaseProtocol {
    private let newsRepository: NewsRepositoryProtocol

    init(newsRepository: NewsRepositoryProtocol) {
        self.newsRepository = newsRepository
    }
    
    func execute() async throws -> [News] {
        try await newsRepository.fetchNews().map( {$0.news()} )
    }
}
