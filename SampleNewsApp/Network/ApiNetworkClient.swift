//
//  ApiNetworkClient.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 11/01/24.
//

import Foundation

/// HTTP Method
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

/// This class provide Network related API calls for fetching data using Rest APis
struct ApiNetworkClient: NetworkClient {
    
    private let session: URLSession
    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    /// Start API call
    /// - Parameters:
    ///   - service: NetWorkService Instance
    ///   - responseHandler: Response Handler
    func start(_ service: NetWorkService) async throws -> Response {
        guard let url = service.apiUrl else {
            throw NetworkClientError.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = service.httpMethod.rawValue
        if let parameters = service.httpBody {
            request.httpBody = try? JSONEncoder().encode(parameters)
        }
        if let additionalHeaders = service.additionalHeaders {
            for (key, value) in additionalHeaders {
                request.allHTTPHeaderFields?[key] = value
            }
        }
        let (data,response) =  try await session.data(for: request)
        
        guard let response = response as? HTTPURLResponse else {
            throw NetworkClientError.noResponse
        }
        
        switch response.statusCode {
        case 200...299:
            return try service.responseParser.parse(data: data)
        default:
            throw NetworkClientError.unknownErrorCode(data, response)
        }
    }
}
