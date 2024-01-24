//
//  NewsContentView.swift
//  TodoList
//
//  Created by Choudhuri, Gourab on 25/01/24.
//

import SwiftUI

struct NewsContentView: View {
    @ObservedObject var viewModel = NewsViewModel()
    var news: News
    var body: some View {
        NavigationView {
            List(viewModel.news) { newsItem in
                NavigationLink(destination: WebView(urlString: newsItem.url)) {
                    NewsCardView(news: newsItem)
                }
            }
            .navigationBarTitle("News")
            .onAppear {
                DispatchQueue.main.async {
                    viewModel.fetchData()
                }
            }
        }
    }
}

#Preview {
    NewsContentView(news: .init(title: "", description: "", imageUrl: "", url: ""))
}

