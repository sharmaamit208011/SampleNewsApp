//
//  MockData.swift
//  SampleNewsAppTests
//
//  Created by Amit Sharma on 07/02/24.
//

import Foundation

@testable import SampleNewsApp

final class MockData {
    
    static var newsDataDTO: [NewsDataDTO] {
        newsListDataModel?.articles ?? []
    }
    
    static var newsDomainDTO: [NewsDomainDTO] {
        return newsDataDTO.map { $0.domainDTO() }
    }
    
    static var newsList: [News] {
        return newsDomainDTO.map { $0.news() }
    }
    
    static var newsListDataModel: NewsListDataModel? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try? decoder.decode(NewsListDataModel.self, from: newsData)
    }
    
    static var newsData: Data {
        loadJsonData("NewsResponse") ?? Data()
    }
    
    static func loadJsonData(_ fromFile: String) -> Data? {
        guard let path = Bundle(for: self).path(forResource: fromFile, ofType: "json") else { return nil }
        let jsonString = try? String(contentsOfFile: path, encoding: .utf8)
        let data = jsonString?.data(using: .utf8)
        return data
    }
}
