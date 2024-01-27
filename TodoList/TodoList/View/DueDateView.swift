//
//  DueDateView.swift
//  TodoList
//
//  Created by Paul, Debojyoti on 27/01/24.
//

import SwiftUI

struct DueDateView: View {
    @State var due:String?
     var alt  = "No date selected"
    @State private var showAlert = false
    var body: some View {
        Button(action: {
            showAlert=true
        }, label: {
            Text("Due Date")
                .foregroundStyle(Color.red)
                .bold()
        })
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Alert ").foregroundStyle(Color.red),
                message: Text(" Due Date is :\(due ?? alt)")
               )}
        
    }
}

#Preview {
    DueDateView(due:String())
}
