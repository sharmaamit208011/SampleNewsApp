//
//  NewsDetailViewModel.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 09/02/24.
//

import Foundation

/// View Model Class to provice data to  NewsDetailView
final class NewsDetailViewModel: ObservableObject {
    @Published var news: News?
    init(news: News) {
        self.news = news
    }
    
    /// Function to check empty title
    /// - Returns: true if title is empty
    func isTitleEmpty() -> Bool {
        return (news?.title?.isEmpty ?? true)
    }
    
    /// Function to  empty description
    /// - Returns: true if description is empty
    func isdescriptionEmpty() -> Bool {
        return (news?.description?.isEmpty ?? true)
    }
    
    /// Function to  empty content
    /// - Returns: true if content is empty
    func iscontentEmpty() -> Bool {
        return (news?.content?.isEmpty ?? true)
    }
    
    /// Function to  empty source name
    /// - Returns: true if source name is empty
    func issourceNameEmpty() -> Bool {
        return (news?.sourceName?.isEmpty ?? true)
    }
    
    /// Convert date to formatted strin g
    /// - Returns: formatted string
    func getFormattedDate() -> String {
        return DateFormatterHelper.getFormattedDate(date: news?.publishedAt)
    }
}
