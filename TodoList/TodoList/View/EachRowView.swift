//
//  EachRowView.swift
//  TodoList
//
//  Created by Paul, Debojyoti on 27/01/24.
//

import SwiftUI

struct EachRowView: View {
    var isCompleted=false
    var title:String
      var desc:String
    var date:Date
    var body: some View {
        HStack{
            Image(systemName: isCompleted ? "checkmark.circle" :"circle")
                .foregroundColor(isCompleted ? .green:.red)
            VStack{
                Text(title)
                    .font(.title2)
                    .padding(.vertical,8)
                HStack{
                    Text(desc)
                    Spacer()
                    DueDateView()
                }
            }
            
            Spacer()
        }
       
    }
}


#Preview {
    EachRowView(title: String(), desc: String(), date: Date())
}
