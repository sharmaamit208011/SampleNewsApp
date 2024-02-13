//
//  NewsListDataModel.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 05/02/24.
//

import Foundation

/// Raw Data Model 
struct NewsListDataModel: Decodable {
    let status: String
    let totalResults: Int
    let articles: [NewsDataDTO]
}
