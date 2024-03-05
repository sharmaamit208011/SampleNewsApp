//
//  MockNetworkClient.swift
//  NewsAppTests
//
//  Created by Amit Sharma on 13/01/24.
//

import Foundation
@testable import SampleNewsApp

class MockNetworkClient: NetworkClient {
    var mockListDataModel: NewsListDataModel?
    var mockError: Error?
    
    
    func start(_ service: NetWorkService) async throws -> Response {
        if let fileName =  Self.getMockFileName(apiIdentifier: service.apiIdentifier) {
            guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {
                throw MockClientError.jsonFileNotFound
            }
            let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            if let transformedData = try service.responseParser.parse(data: data ?? "") {
                return transformedData
            } else {
                throw MockClientError.notParsable(data)
            }
        } else {
            throw MockClientError.jsonFileNotFound
        }
    }
}
 
extension MockNetworkClient {
     static func getMockFileName(apiIdentifier: APIIdentifier?) -> String? {
        var fileName: String?
        guard let apiIdentifier = apiIdentifier else { return nil }
        switch apiIdentifier {
        case .fetchLatestNews:
            fileName = "NewsResponse"
            
        }
        return fileName
    }
}
 
