//
//  Meal_MatchApp.swift
//  Meal Match
//
//  Created by Ekambeer Grewal on 1/9/26.
//

import SwiftUI

@main
struct Meal_MatchApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate 
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                            Splash()
                        }
        }
    }
}
