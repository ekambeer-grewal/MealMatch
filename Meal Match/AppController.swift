//
//  AppController.swift
//  Meal Match
//
//  Healper class for Authentication.
//
//  Created by Ekambeer Grewal on 5/12/26.
//

import SwiftUI
import FirebaseAuth

@Observable
class AppController {
    var email = ""
    var password = ""
    var confirmPassword = ""
    
    func SignUp() async throws {
        _ = try await Auth.auth().createUser(withEmail: email, password: password)
    }
    
    func LogIn() async throws {
        _ = try await Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func SignOut() throws {
        try Auth.auth().signOut()
    }
}
