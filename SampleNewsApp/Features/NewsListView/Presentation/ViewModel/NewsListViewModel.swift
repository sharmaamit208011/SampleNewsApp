//
//  NewsListViewModel.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 11/02/24.
//

import Foundation

/// View Model Class to provide data to News List View
final class NewsListViewModel: ObservableObject {
    @Published var newsList: [News]?
    
    init(newsList: [News]? = nil) {
        self.newsList = newsList
    }
}
