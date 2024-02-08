//  LoginPageView.swift
//  TodoList
//
//  Created by Singh Bhadauria, Abhishek on 26/01/24.
//

import SwiftUI

struct LoginPageView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    @State private var validateUser = false
    @ObservedObject var usercredentialvm = UserCredentialsVM()
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                //Bacground
                Color.pink
                    .ignoresSafeArea()
                    .opacity(0.4)
                
                //Content
                VStack {
                    //header
                    VStack{
                        Text("ToDoApp")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("Getting Things Done")
                            .font(.headline)
                    }
                    .foregroundStyle(Color.white)
                    .padding(.top, 40)
                    Spacer()
                    //Login Form
                    VStack{
                        TextField("Username", text: $username)
                            .textFieldStyle(PlainTextFieldStyle())
                            .textInputAutocapitalization(.sentences)
                            .padding(.bottom,  10)
                        SecureField("Password", text: $password)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(.bottom, 20)
                        
                        NavigationLink(destination: TabViewNew(),isActive: $validateUser) {
                            Text("Login")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.pink)
                                .cornerRadius(10)
                                .onTapGesture {
                                    validateUser = usercredentialvm.validateUserCredentials(username: username, password: password)
                                }}
                    }
                    .frame(maxWidth: 400)
                    .padding()
                    .padding(.vertical,40)
                    .background(
                        Color.white
                            .opacity(0.4)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    ).padding()
                    Spacer()
                    //Register page Navigation link
                    VStack{
                        HStack {
                            Text("New around here?")
                                .foregroundStyle(Color.black)
                            NavigationLink("Register", destination: RegisterPageView())
                                .foregroundStyle(Color.pink)
                                .fontWeight(.bold)
                        }
                    }
                    .padding(.bottom,40)
                }
                
            }
        }
    }
}


#Preview {
    
    LoginPageView()
}

