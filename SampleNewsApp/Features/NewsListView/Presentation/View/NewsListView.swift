//
//  NewsListView.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 07/02/24.
//

import SwiftUI

/// Provide News list view
struct NewsListView: View {
    @ObservedObject var viewModel: NewsListViewModel
    var body: some View {
        List(viewModel.newsList ?? [], id: \.newsID) { news in
            NavigationLink(destination: NewsDetailView(viewModel: NewsDetailViewModel(news: news))) {
                NewsItemView(viewModel: NewsItemViewModel(news: news))
            }
        }.animation(.easeInOut, value: 1.0)
         .listStyle(.plain)
    }
}
