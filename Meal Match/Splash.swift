//
//  ContentView.swift
//  Meal Match
//
//  Created by Ekambeer Grewal on 1/9/26.
//

/*
 This is the spalsh page that user will encounter when open the app. It has some auto-scroll images and buttons that user will click to sign-up and login.
 */

import SwiftUI
import Combine

struct Splash: View {
    
    // Timer for auto scroll images
    private let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()

    // current index of image in the array
    @State private var currentIndex: Int = 0
    
    // To show previous Image if user scroll back
    @State private var showPreviousImage: Bool = false
    
    // Variables to direct user to respective pages when user click the button
    @State private var showSignUp = false
    @State private var showLogin = false
    
    // Array of names of images
    private let images = ["SplashImage1", "SplashImage2", "SplashImage3"]
    
    // Main UI Body
    var body: some View {
        VStack{
            
            // welcome texts
            Text("Welcome to")
                .bold()
                .font(.custom("Istok Web", size: 16))
                .foregroundColor(Color(white: 0.7))
                .padding()
            Text("Meal Match")
                .bold()
                .bold()
                .font(.custom("Georgia", size: 48))
                .foregroundColor(Color(white:1))
            
            //
            ZStack{
                // Loop through all image indices
                ForEach(0..<images.count, id: \.self) { index in
                    
                    // Only show the image with current index
                    if index == currentIndex {
                        Image(images[index])
                            .resizable()
                            .frame(width: 340, height: 400)
                            .cornerRadius(30)
                            .padding(20)
                        
                            // Apply a transition animation when the image changes
                            .transition(.asymmetric(
                                // When inserting a new image:
                                // move from left if showing previous image,
                                // otherwise move from right
                                insertion: .move(edge: showPreviousImage ? .leading : .trailing),
                                
                                // When removing the current image:
                                // move to right if showing previous image,
                                // otherwise move to left
                                removal: .move(edge: showPreviousImage ? .trailing : .leading)))
                    }
                    
                }
            }
            // Auto scroll after 4 sec and increment/update current index
            .onReceive(timer) { _ in
                showPreviousImage = false
                withAnimation(.snappy) {
                    currentIndex = (currentIndex + 1) % images.count
                }
            }
            
            // Let user drag image manually
            .gesture(
                DragGesture()
                    .onEnded({ value in
                        let threshold: CGFloat = 100
                        if value.translation.width < -threshold {
                            showPreviousImage = false
                            
                            withAnimation(.snappy){
                                currentIndex = (currentIndex + 1)  % images.count
                            }
                        } else if value.translation.width > threshold {
                            showPreviousImage = true
                            
                            withAnimation(.snappy){
                                currentIndex = (currentIndex - 1 + images.count)  % images.count
                            }
                        }
                    })
            )
            
            // Sign up button
            Button {
                // Set showSignUp to true if user click button
                showSignUp = true
            } label : {
                Text("Sign Up for Free")
                    .ghostButton()
            }
            .padding(10)
            
            // Login button
            Button{
                // Set showLogin to true if user click button
                showLogin = true
            } label : {
                Text("Login")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.textGreen)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.splashBG)
        
        // Navigate to Signup page when showSign up true
        .navigationDestination(isPresented: $showSignUp) {
            SignUp()
        }

        // Navigate to Login page when showLogin up true
        .navigationDestination(isPresented: $showLogin) {
            Login()
        }
    }
        
        
}
    
#Preview {
    Splash()
}
