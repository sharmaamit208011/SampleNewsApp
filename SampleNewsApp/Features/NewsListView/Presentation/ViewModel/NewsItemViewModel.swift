//
//  NewsItemViewModel.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 11/02/24.
//

import Foundation

/// View Model Class to provice data to News Iteam View
final class NewsItemViewModel: ObservableObject {
    @Published var news: News?
    init(news: News) {
        self.news = news
    }
    
    func isTitleEmpty() -> Bool {
        return (news?.title?.isEmpty ?? true)
    }
    
    func getFormattedDate() -> String {
        return DateFormatterHelper.getFormattedDate(date: news?.publishedAt)
    }
}
