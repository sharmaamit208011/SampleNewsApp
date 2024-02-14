//
//  NewsDetailViewModel.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 09/02/24.
//

import Foundation

/// View Model Class to provide data to  NewsDetailView
final class NewsDetailViewModel: ObservableObject {
    @Published var news: News?
    init(news: News) {
        self.news = news
    }
    
    /// true if title is empty
    var isTitleEmpty: Bool {
        return !(news?.title?.isEmpty ?? true)
    }
    
    /// true if description is empty
    var isdescriptionEmpty: Bool {
        return !(news?.description?.isEmpty ?? true)
    }
    
    /// true if content is empty
    var iscontentEmpty: Bool {
        return !(news?.content?.isEmpty ?? true)
    }
    
    /// true if source name is empty
    var isSourceNameEmpty: Bool {
        return !(news?.sourceName?.isEmpty ?? true)
    }
    
    /// Published Date
    var publishedDate: String {
        return DateFormatterHelper.getFormattedDate(date: news?.publishedAt)
    }
}
