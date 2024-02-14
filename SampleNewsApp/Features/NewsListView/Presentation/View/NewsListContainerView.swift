//
//  NewsListContainerView.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 07/02/24.
//

import SwiftUI

/// Provide container view for News List
struct NewsListContainerView: View {
    @ObservedObject var newsViewModel: NewsViewModel
    
    init(newsViewModel: NewsViewModel) {
        self.newsViewModel = newsViewModel
    }
    var body: some View {
        NavigationView {
            VStack {
                if newsViewModel.isErrorMessageEmpty {
                    Text(newsViewModel.errorMessage)
                }
                else {
                    NewsListView(viewModel: NewsListViewModel(newsList: newsViewModel.newsList))
                        .navigationTitle("News")
                }
            }
            .task {
                await newsViewModel.fetchNews()
            }
        }
    }
}
