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
            Color.gray
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
//                .padding(.top,40)
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
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
//
//                    Button(action: {
//                        //Button Login Logic here
//                    }
//                           , label: {
//                        ZStack{
//                            RoundedRectangle(cornerRadius: 10)
//                                .foregroundStyle(Color.blue)
//                            Text("Register")
//                                .foregroundStyle(Color.white)
//                        }
//                        .frame(height: 40)
//                        //                        .padding()
//                    }).padding(.top,30)
//                    
                    
                    
                    
                    
                    
                    
                    
                    NavigationLink(destination: LoginPageView(),isActive: $createNewUser) {
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .onTapGesture {
                                
                                
                                usercredentialvm.saveUserCredentials(username: username, password: password)
                               
                                
                                createNewUser = usercredentialvm.isValidEmail(username)
                                
                            
                                
                                // we need to save data on this tap gesture calling the method created in usercredentialvm

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
                //Register page Navigation link
//                VStack{
//                    HStack {
//                        Text("New around here ?")
//                            .foregroundStyle(Color.white)
//                        NavigationLink("Register", destination: RegisterPageView())
//                    }
//                }
//                .padding(.bottom,40)
            }
            
        }

    }
}

#Preview {
    RegisterPageView()
}


