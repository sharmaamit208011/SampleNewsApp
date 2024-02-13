//
//  NewsAPIService.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 12/01/24.
//

import Foundation

/// Purpose of this class is to construct parameter to make api call
class NewsAPIService: NetWorkService {
    var apiEnvironment: Environment = DefaultEnvironment()
    var apiIdentifier: APIIdentifier? = .fetchLatestNews
    var apiUrl: URL? {
        let queryItems = [URLQueryItem(name: "country", value: "us"), URLQueryItem(name: "apiKey", value: self.apiEnvironment.ApiKey)]
        guard var urlComps = URLComponents(string: "\(self.apiEnvironment.baseURL)\(self.apiEnvironment.version)" + "/top-headlines") else { return nil }
        urlComps.queryItems = queryItems
        return urlComps.url
    }
    var httpMethod: HTTPMethod = .get
    var httpBody: Encodable?
    var responseParser: ResponseParser = NewsApiResponseParser()
    var additionalHeaders: [String : String]?
}
