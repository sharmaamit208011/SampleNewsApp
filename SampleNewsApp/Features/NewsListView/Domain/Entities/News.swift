//
//  News.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 06/02/24.
//

import Foundation

/// Presentable Model on UI
struct News {
    let newsID: UUID?
    let title: String?
    let description: String?
    let newsURL: String?
    let imageUrl: String?
    let publishedAt: Date?
    let sourceName: String?
    let content: String?
}

extension News {
    var imageLink: URL? {
        if let urlString = imageUrl, let url = URL(string: urlString) {
            return url
        }
        return nil
    }
    
    var newsLink: URL? {
        if let urlString = newsURL, let url = URL(string: urlString) {
            return url
        }
        return nil
    }
}
