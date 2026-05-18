//
//  RandomPlace.swift
//  Internly-AMAC
//
//  Created by Alexander T. Manov on 5/12/26.
//

import SwiftUI

struct Search: View{
    // states the category the user wants and then will switch to the map view
    @State var category: String
    //tells weather or not the view should change, and only happens when the user submits the text field
    @State var shouldNavigate = false
    var body: some View{
        VStack{
            Text("Search for a category: \n or \n Search for a mood:")
                .multilineTextAlignment(.center)
                .font(.title)
                .bold()
                .foregroundStyle(Color.white)
            TextField("Enter a category", text: $category)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.green)
                .onSubmit {
                    //says hey, we are ready to change the view
                    shouldNavigate = true
                }
                .navigationDestination(isPresented: $shouldNavigate) {
                    //if we are ready to navigate(should navigate = true)
                    //then change to the map with the category that you typed in
                    MapView(theme: category)
                }
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background( LinearGradient(
            colors: [.yellow, .green, .yellow],
            startPoint: .top,
            endPoint: .bottom
        ))
    }
}
