//
//  NewsViewModel.swift
//  TodoList
//
//  Created by Choudhuri, Gourab on 25/01/24.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var news: [News] = []
    
    func fetchData() {
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&apiKey=964e51d23683434cbef6012a5b77b326") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(NewsResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.news = result.articles.map {
                            News(title: $0.title, description: $0.description ?? "", imageUrl: $0.urlToImage ?? "", url: $0.url ?? "")
                        }
                    }
                } catch let error {
                    print("Error decoding JSON: \(error)")
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
            }
        }
        
        task.resume()
    }
}
