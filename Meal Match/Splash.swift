//
//  ContentView.swift
//  Meal Match
//
//  Created by Ekambeer Grewal on 1/9/26.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    private let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()

    @State private var currentIndex: Int = 0
    @State private var showPreviousImage: Bool = false
    private let images = ["SplashImage1", "SplashImage2", "SplashImage3"]
    
    var body: some View {
        VStack{
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
            
            ZStack{
                ForEach(0..<images.count, id: \.self) { index in
                    if index == currentIndex {
                        Image(images[index])
                            .resizable()
                            .frame(width: 340, height: 400)
                            .cornerRadius(30)
                            .padding(20)
                            .transition(.asymmetric(insertion: .move(edge: showPreviousImage ? .leading : .trailing), removal: .move(edge: showPreviousImage ? .trailing : .leading)))
                    }
                    
                }
            }
            .onReceive(timer) { _ in
                showPreviousImage = false
                withAnimation(.snappy) {
                    currentIndex = (currentIndex + 1) % images.count
                }
            }
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
            Button{
                
            } label : {
                Text("Sign Up for Free")
                    .font(.system(size: 24, weight: .semibold))
                    .frame(width: 330, height: 50)
                    .foregroundColor(Color(white: 1))
                    .background(Color(.textGreen))
                    .cornerRadius(50)
                    
            }
            .padding(10)
            Button{
                
            } label : {
                Text("Login")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.textGreen)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.splashBG)
    }
        
}
    
#Preview {
    ContentView()
}
