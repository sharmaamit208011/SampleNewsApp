//
//  NewsDetailViews.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 08/02/24.
//

import SwiftUI
import Kingfisher

/// Provide news detail view
struct NewsDetailView: View {
    @State var viewModel: NewsDetailViewModel
    
    init(viewModel: NewsDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 10.0) {
                KFImage(viewModel.news?.imageLink)
                    .placeholder({
                        Image("default-news", bundle: .main)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                            .aspectRatio(contentMode: .fit)
                    })
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .leading, spacing: 12.0) {
                    if !viewModel.isTitleEmpty() {
                        Text(viewModel.news?.title ?? "")
                            .font(.custom("HelveticaNeue-Bold", size: 16.0))
                    }
                    if !viewModel.isdescriptionEmpty() {
                        Text(viewModel.news?.description ?? "")
                            .font(.custom("HelveticaNeue", size: 15.0))
                    }
                    if !viewModel.iscontentEmpty() {
                        Text(viewModel.news?.content ?? "")
                            .font(.custom("HelveticaNeue", size: 14.0))
                    }
                    NavigationLink(destination: NewsWebView(newsURL: viewModel.news?.newsURL ?? "")) {
                        Text("Read full article")
                    }
                    Text(viewModel.getFormattedDate())
                        .font(.custom("HelveticaNeue", size: 12.0))
                    if !viewModel.issourceNameEmpty() {
                        Text(viewModel.news?.sourceName ?? "")
                            .font(.custom("HelveticaNeue-Medium", size: 10.0))
                    }
                }.frame(
                    maxWidth: .infinity,
                    alignment: .topLeading
                )
                .padding(EdgeInsets(top: 0, leading: 0.0, bottom: 10.0, trailing: 0.0))
            }
        }
        .navigationTitle(viewModel.news?.sourceName ?? "")
        .padding(10.0)
    }
}
