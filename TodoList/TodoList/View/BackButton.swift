//
//  BackButton.swift
//  TodoList
//
//  Created by Paul, Debojyoti on 27/01/24.
//

import SwiftUI

struct backButton: View {
   
        @Environment(\.presentationMode) var presentationMode

            var body: some View {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                    .foregroundColor(.blue)
                }
            }
    
}

#Preview {
    backButton()
}
