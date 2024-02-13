//
//  NewsItemView.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 30/01/24.
//

import SwiftUI
import Kingfisher

/// Provide news list single item view
struct NewsItemView: View {
    @State var viewModel: NewsItemViewModel
    init(viewModel: NewsItemViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
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
            
            VStack(alignment: .leading, spacing: 4.0) {
                if !viewModel.isTitleEmpty() {
                    Text(viewModel.news?.title ?? "")
                        .font(.custom("HelveticaNeue-Bold", size: 16.0))
                }
                Text(viewModel.getFormattedDate())
                        .font(.custom("HelveticaNeue", size: 12.0))
            }.frame(
                maxWidth: .infinity,
                alignment: .topLeading
            )
            .padding(EdgeInsets(top: 0, leading: 0.0, bottom: 10.0, trailing: 0.0))
        }
    }
}
