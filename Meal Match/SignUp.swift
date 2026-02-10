//
//  SignUp.swift
//  Meal Match
//
//  Created by Ekambeer Grewal on 1/9/26.
//
/*
 This is the signup page that user will use to create an account. It has textfield for email input and securefield for password input and buttons that user will click after putting in information and navigate to profile page.
 */

import SwiftUI

struct SignUp: View {
    
    // Variable for action on buttons
    @State private var showLogin: Bool = false
    @State private var showProfile: Bool = false
    
    // Variables save input from user
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        ZStack{
            
            // Background
            Image("SignUpBG")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            // Main Stack of user interface
            VStack(alignment: .leading){
                // Sign up text at the top of page
                Text("Sign Up")
                    .font(.custom("Carlito-Bold", size: 40))
                    .offset(y: -60)
                
                // Input email from user to create account
                Text("Email")
                    .font(.system(size: 20))
                    
                
                TextField("Email", text: $email)
                    .ghostTextField()
                    
                // Input password from user to setup account
                Text("Password")
                    .font(.system(size: 20))
                
                SecureField("Password", text: $password)
                    .ghostSecureField()
                
                // Re-enter password to confirm it
                Text("Confirm Password")
                    .font(.system(size: 20))
                
                SecureField("Confirm Password", text: $confirmPassword)
                    .ghostSecureField()
                
                // Button that navigate to Profile page
                Button(action: {
                    showProfile = true
                }) {
                    Text("Sign Up")
                        .ghostButton()
                }
                .offset(y: 40)
                .padding(.leading)
                .padding(.bottom, 10)
                
                // If user already have an account user can go to login page
                HStack{
                    Text("Already have an account?")
                    Button(action: {
                        showLogin = true
                    }) {
                        Text("Log In")
                            .foregroundColor(.blue)
                    }
                }
                .padding(.leading, 50)
                .offset(y: 40)
                .navigationDestination(isPresented: $showLogin) {
                    Login()
                }
                .navigationDestination(isPresented: $showProfile) {
                    Profile()
                }
            }
        }
    }
    
    
}

#Preview {
    SignUp()
}
