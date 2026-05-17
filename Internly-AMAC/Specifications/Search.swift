//
//  RandomPlace.swift
//  Internly-AMAC
//
//  Created by Alexander T. Manov on 5/12/26.
//

import SwiftUI

struct Search: View{
    @State var category: String
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
                    shouldNavigate = true
                }
                .navigationDestination(isPresented: $shouldNavigate) {
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
