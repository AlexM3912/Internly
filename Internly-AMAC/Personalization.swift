//
//  Personalization.swift
//  Internly-AMAC
//
//  Created by Alexander T. Manov on 5/12/26.
//

import SwiftUI

struct Personalization: View{
    @State var path = NavigationPath()
    @State private var category = "food"
    var body: some View{
        NavigationStack(path: $path){
            //recomneded place
            
            VStack{
                
                NavigationLink(value: "showCategories") {
                    Text("Categories")
                }
                .modifier(frameForCategories())
                
                
                NavigationLink("Mood") {
                    Mood()
                }
                .modifier(frameForCategories())
                
                NavigationLink("Suprise Me") {
                    RandomPlace()
                }
                .modifier(frameForCategories())
                //                NavigationLink("Search") {
                //  ablew to search
                //                }
                //                .modifier(frameForCategories())
            }
            .navigationTitle("Traventure")
            .navigationDestination(for: String.self , destination: { value in
                if value == "showCategories" {
                    Categories()
                        .navigationTitle("Choose a category")
                } else {
                    MapView(theme: value)
                }
            })
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background( LinearGradient(
                colors: [.yellow, .green, .yellow],
                startPoint: .top,
                endPoint: .bottom
            ))
            .ignoresSafeArea()
            
        }
    }
}






//Arts and Culture: museum, musicVenue, theaterEducation: library, planetarium, school, universityEntertainment: movieTheater, nightlifeHealth & Safety: fireStation, hospital, pharmacyServices: laundry, postOfficeTransportation: airport, marina, publicTransportFood/Retail: foodMarket, gasStation, restaurant, store, wineryRecreation/Other: nationalPark, park, parking, restrooms, stadium, zoo

//museum, musicVenue, library, planetarium, school, movie theater, firstation, hospital, laundry, airport, marina, foodMarket, gasStation, erstaurant, store, national park, park, parking, restrooms, stadium, zoo
