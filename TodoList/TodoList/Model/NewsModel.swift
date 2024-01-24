//
//  NewsModel.swift
//  TodoList
//
//  Created by Choudhuri, Gourab on 25/01/24.
//

import Foundation

struct News: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let imageUrl: String
    let url: String
}

struct NewsResponse: Codable {
    let articles: [Article]
    
    struct Article: Codable {
        let title: String
        let description: String?
        let urlToImage: String?
        let url: String?
    }
}
