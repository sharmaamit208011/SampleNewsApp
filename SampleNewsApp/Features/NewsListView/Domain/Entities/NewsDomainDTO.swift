//
//  NewsDomainDTO.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 06/02/24.
//

import Foundation

struct NewsDomainDTO {
    let newsID: UUID?
    let author: String?
    let title: String?
    let description: String?
    let newsURL: String?
    let imageUrl: String?
    let publishedAt: Date?
    let content: String?
    let sourceName: String?
}

extension NewsDomainDTO {
    func news() -> News {
        News(newsID: newsID,
             title: title,
             description: description,
             newsURL: newsURL,
             imageUrl: imageUrl,
             publishedAt: publishedAt,
             sourceName: sourceName,
             content: content)
    }
}
