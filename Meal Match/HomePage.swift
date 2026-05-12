//
//  HomePage.swift
//  Meal Match
//
//  Created by Ekambeer Grewal on 2/5/26.
//

import SwiftUI

struct HomePage: View {
    
    @Environment(AppController.self) private var appController
    
    @State private var showSplash: Bool = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        // Button that navigate to Profile page
        Button(action: {
            showSplash = true
            authenticate()
        }) {
            Text("Sign Up")
                .ghostButton()
        }
        .offset(y: 40)
        .padding(.leading)
        .padding(.bottom, 10)
        .navigationDestination(isPresented: $showSplash) {
            Splash()
        }
    }
    
    func authenticate() {
        Task {
            do{
                    try appController.SignOut()
            } catch {
                    print(error.localizedDescription)
                }
            }
    }
}

#Preview {
    HomePage()
        .environment(AppController())
}
