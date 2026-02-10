//
//  Profile.swift
//  Meal Match
//
//  Created by Ekambeer Grewal on 1/22/26.
//

/*
 This is the profile page that user will use to create a profile. It has textfield for name input and user will input their birthday and select any diet ristrictions and button that user will click after putting in information and navigate to home page.
 */


import SwiftUI

struct Profile: View {
    
    // Variable for action on create profile button
    @State private var showHome: Bool = false
    
    // Variables to store user data to create user profile
    @State private var birthday = Date()
    @State private var name: String = ""
    @State private var selectedDietRistrictions: [String] = []
    // Bool that is true if dropdown list of diet ristrictions is expanded
    @State private var isExpanded = false
    
    // List of diet Ristrictions
    let dietRistrictions: [String] = ["Gluten-Free", "Vegetarian", "Lactose-Free", "Vegan", "Dairy-Free", "Nut-Free", "Egg-Free"]
    
    // Create dropdown list to select from
    var dietDropdown: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Loop through the restriction list and create diet row for each one
            ForEach(dietRistrictions, id: \.self) { diet in
                dietRow(diet: diet)
            }
        }
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color(.systemGray6))
                .shadow(color: Color.gray.opacity(0.3), radius: 10)
                .frame(width: 300)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                .frame(width: 300)
        )
    }

    // Create a row with pass down diet ristriction
    func dietRow(diet: String) -> some View {
        
        VStack{
            // Show diet restriction
            Text(diet)
                .foregroundColor(.gray)
                .frame(width: 250)

        }
        .padding(.horizontal, 12)
        .background(
            // Create green rectangle background color to show selected row
            RoundedRectangle(cornerRadius: 30)
                .fill(
                    selectedDietRistrictions.contains(diet)
                    ? Color.textGreen
                    : Color.clear
                )
        )
        .onTapGesture {
            toggleDiet(diet)
        }
    }

    // Add and remove diet from selectedDietRistriction when selected and unselected
    func toggleDiet(_ diet: String) {
        if selectedDietRistrictions.contains(diet) {
            selectedDietRistrictions.removeAll { $0 == diet }
        } else {
            // Append to array
            selectedDietRistrictions.append(diet)
        }
    }

    
    var body: some View {
        ZStack{
            // Background image
            Image("SignUpBG")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading){
                
                // Text at the top
                Text("Create Profile")
                    .font(.custom("Carlito-Bold", size: 40))
                    .offset(y: -20)
                
                // Profile Image
                
                // TODO: add action to is and make it show added pic
                Image("ProfileImg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 110, height: 110)
                    .clipShape(Circle())
                    .padding(5)
                    .overlay(
                            Circle()
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    .offset(x: 120)
                    
                
                // Input name of user
                Text("Name")
                    .font(.system(size: 20))
                    
                
                TextField("Name", text: $name)
                    .ghostTextField()
                    
                
                // Input Birthday of user
                Text("Birthday")
                    .font(.system(size: 20))
                
                DatePicker("   Birthday", selection: $birthday, in: ...Date(), displayedComponents: .date)
                    .ghostDatePicker()
                
                
                // Dropdown picker for diet ristrictions
                Text("Diet Restriction")
                    .font(.system(size: 20))
                
                
                VStack{
                    HStack{
                        Text("Selected Diet Ristrictions")
                            .padding(.leading, 5)
                            .font(.headline)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        // Show chevron and change the isExpanded bool when clicked to show list of diet ristrictions
                        Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                            .foregroundColor(.gray)
                            .onTapGesture {
                                withAnimation(.easeInOut){
                                    isExpanded.toggle()
                                }
                            }
                    }
                    // Show list to select form is isExpanded is true
                    if isExpanded{
                        dietDropdown
                    }
                }
                .foregroundStyle(.gray)
                .padding(.horizontal)
                .padding(.top, 25)
                .padding(.bottom, 25)
                .frame(width: 360)
                .background(.white)
                .cornerRadius(30)
                .shadow(color: .gray, radius: 4, x: 3, y: 4)
                .animation(.easeInOut, value: isExpanded)
                
                // Button to create profile and navigate to home page
                Button(action: {
                    showHome = true
                }) {
                    Text("Create Profile")
                        .ghostButton()
                }
                .offset(y: 40)
                .padding(.leading)
                .padding(.bottom, 10)
                
            }
        }
        .navigationDestination(isPresented: $showHome){
            HomePage();
        }
    }
}

#Preview {
    Profile()
}
