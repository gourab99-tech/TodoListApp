//
//  RegisterPageView.swift
//  TodoList
//
//  Created by Singh Bhadauria, Abhishek on 26/01/24.
//

import SwiftUI

struct RegisterPageView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var fullname: String = ""
    @State private var createNewUser = false
    @ObservedObject var usercredentialvm = UserCredentialsVM()
    
    var body: some View {
        ZStack{
            //Bacground
            Color.pink
                .opacity(0.4)
                .ignoresSafeArea()
            
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
                .padding(.top,40)
                Spacer()
                //Login Form
                VStack{
                    TextField("Fullname", text: $fullname)
                        .textFieldStyle(PlainTextFieldStyle())
                        .textInputAutocapitalization(.sentences)
                        .padding(.bottom,10)
                    TextField("Username", text: $username)
                        .textFieldStyle(PlainTextFieldStyle())
                        .textInputAutocapitalization(.sentences)
                        .padding(.bottom,10)
                    SecureField("Password", text: $password)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.bottom)
                    
                    NavigationLink(destination: LoginPageView(),isActive: $createNewUser) {
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.pink)
                            .cornerRadius(10)
                            .onTapGesture {
                                usercredentialvm.saveUserCredentials(username: username, password: password)
                                
                                createNewUser = true
                            }
                    }
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
            }
            
        }
        
    }
}

#Preview {
    RegisterPageView()
}


