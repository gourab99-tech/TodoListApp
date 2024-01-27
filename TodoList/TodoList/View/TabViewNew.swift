//
//  TabView.swift
//  TodoList
//
//  Created by Paul, Debojyoti on 27/01/24.
//

import SwiftUI

struct TabViewNew: View {
    var body: some View {
        TabView {
           ProfileView()
                .tabItem {
                    Image(systemName: "house")
                    
                }
            DisplayTasksView()
                .tabItem {
                    Image(systemName: "list.bullet.rectangle")
                    
                }
            NewsContentView(news: .init(title: "", description: "", imageUrl: "", url: ""))
                .tabItem {
                    Image(systemName: "newspaper")
                    
                }
            
        }
    }
}

