//
//  Constant.swift
//  Meal Match
//
//  Created by Ekambeer Grewal on 1/9/26.
//
import Foundation
import SwiftUI

struct Constant{
    
    
    
}
extension Text{
        func ghostButton() -> some View {
            self
                .font(.system(size: 24, weight: .semibold))
                .frame(width: 330, height: 50)
                .foregroundColor(Color(white: 1))
                .background(Color(.textGreen))
                .cornerRadius(50)
    }
    
    
}

extension TextField{
    func ghostTextField() -> some View {
        self
            .padding(.leading, 10)
            .frame(width: 360, height: 70)
            .background(.white)
            .cornerRadius(30)
            .shadow(color: .gray, radius: 4, x: 3, y: 4)
            .padding(.bottom, 20)
    }
}

extension SecureField{
    func ghostSecureField() -> some View {
        self
            .padding(.leading, 10)
            .frame(width: 360, height: 70)
            .background(.white)
            .cornerRadius(30)
            .shadow(color: .gray, radius: 4, x: 3, y: 4)
            .padding(.bottom, 20)
    }
}


extension DatePicker{
    func ghostDatePicker() -> some View {
        self
            .padding(.trailing, 10)
            .frame(width: 360, height: 70)
            .background(.white)
            .cornerRadius(30)
            .shadow(color: .gray, radius: 4, x: 3, y: 4)
            .padding(.bottom, 20)
    }
}


