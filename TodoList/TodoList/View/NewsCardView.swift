//
//  NewsCardView.swift
//  TodoList
//
//  Created by Choudhuri, Gourab on 25/01/24.
//

import SwiftUI

struct NewsCardView: View {
    var news: News
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: news.imageUrl)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 100)
                        .clipped()
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 100)
                        .clipped()
                default:
                    EmptyView()
                }
            }
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 0.5)
            )
            
            VStack(alignment: .leading, spacing: 8) {
                Text(news.title)
                    .font(.headline)
                    .lineLimit(2)
                Text(news.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(3)
            }
            .padding(8)
        }
        .padding(8)
    }
}

#Preview {
    NewsCardView(news: .init(title: "", description: "", imageUrl: "", url: ""))
}

