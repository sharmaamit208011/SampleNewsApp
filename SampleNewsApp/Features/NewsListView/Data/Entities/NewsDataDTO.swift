//
//  NewsDataDTO.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 05/02/24.
//

import Foundation

struct NewsDataDTO: Identifiable, Decodable {
    let id = UUID()
    let source: Source?
    let author: String?
    let title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: Date?
    let content: String?
    
    enum CodingKeys: String, CodingKey {
        case source, author, title, description, url, urlToImage
        case publishedAt
        case content
    }
}
extension NewsDataDTO {
    func domainDTO() -> NewsDomainDTO {
        NewsDomainDTO(newsID: id,
                      author: author,
                      title: title,
                      description: description,
                      newsURL: url,
                      imageUrl: urlToImage,
                      publishedAt: publishedAt,
                      content: content,
                      sourceName: source?.name)
    }
}

