//
//  NewsViewModel.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 10/01/24.
//

import Foundation

/// View Model Class to provide data to News List Navigation View
final class NewsViewModel: ObservableObject {
    
    @Published var newsList: [News] = []
    @Published var errorMessage: String = ""
    private let fetchNewsUseCase: FetchNewsUseCaseProtocol
        
    init(fetchNewsUseCase: FetchNewsUseCaseProtocol) {
        self.fetchNewsUseCase = fetchNewsUseCase
    }
    
    var isErrorMessageEmpty: Bool {
        return !errorMessage.isEmpty
    }
    
    @MainActor
    func fetchNews() async {
        do {
            self.newsList = try await fetchNewsUseCase.execute()
        }
        catch {
            errorMessage = error.localizedDescription
        }
    }
}
