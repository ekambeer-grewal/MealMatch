//
//  Login.swift
//  Meal Match
//
//  Created by Ekambeer Grewal on 1/9/26.
//

/*
 This is the login page that user will use to log back in thier already made account. It has textfield for email input and seecure field for password and button that user will click after putting in information and navigate to home page.
 */

import SwiftUI

struct Login: View {
    
    // Bool variables to put logic on buttons
    @State private var showSignUp = false
    @State private var showHome = false
    
    // Variables to store user input
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack{
            
            // Background image
            Image("SignUpBG")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading){
                
                // Text at the top
                Text("Login")
                    .font(.custom("Carlito-Bold", size: 40))
                    .offset(y: -100)
                
                // User input their email
                Text("Email")
                    .font(.system(size: 20))
                    
                
                TextField("Email", text: $email)
                    .ghostTextField()
                    .padding(.bottom, 30)
                    
                
                // User input password
                Text("Password")
                    .font(.system(size: 20))
                
                SecureField("Password", text: $password)
                    .ghostSecureField()
                
                
                // Log user in and navigate to home page
                Button(action: {
                    showHome = true
                }) {
                    Text("Login")
                        .ghostButton()
                }
                .offset(y: 40)
                .padding(.leading)
                .padding(.bottom, 10)
                
                // Navigate user to signup if user don't have an account
                HStack{
                    Text("Don't have an account?")
                    Button(action: {
                        showSignUp = true
                    }) {
                        Text("Sign Up")
                            .foregroundColor(.blue)
                    }
                }
                .padding(.leading, 50)
                .offset(y: 40)
                .navigationDestination(isPresented: $showSignUp) {
                    SignUp()
                }
                .navigationDestination(isPresented: $showHome) {
                    HomePage()
                }
            }
        }
    }
}

#Preview {
    Login()
}
