//
//  tabView.swift
//  TodoList
//
//  Created by Paul, Debojyoti on 27/01/24.
//

import SwiftUI

struct tabView: View {
    var body: some View {
        TabView {
            profile()
                .tabItem {
                    Image(systemName: "house")
                    
                }
            displayTasks()
                .tabItem {
                    Image(systemName: "list.bullet.rectangle")
                    
                }
            news()
                .tabItem {
                    Image(systemName: "newspaper")
                    
                }
            
        }
    }
}

#Preview {
    tabView()
}
