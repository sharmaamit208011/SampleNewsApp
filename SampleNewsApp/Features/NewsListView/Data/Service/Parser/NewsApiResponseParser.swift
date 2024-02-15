//
//  NewsApiResponseParser.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 12/01/24.
//

import Foundation

/// Purpose of this class to parse raw data in it's own way and return models/objects
struct NewsApiResponseParser: ResponseParser {
    func parse(data: Any) throws -> Any? {
        guard let data = data as? Data else { return nil }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
        
        do {
            return try decoder.decode(NewsListDataModel.self, from: data)
        }
        catch  {
            throw NetworkClientError.notParsable(data)
        }
    }
}
