//
//  Personalization.swift
//  Internly-AMAC
//
//  Created by Alexander T. Manov on 5/12/26.
//

import SwiftUI

struct Personalization: View{
    //this make a fluid path between the views and allows to change other values in the navigation links
    @State var path = NavigationPath()
    var body: some View{
        NavigationStack(path: $path){
            
            VStack{
        //all the navigationlinks give a value which later using the navigation destination value that then changes the view
                NavigationLink(value: "showCategories") {
                    Text("Categories")
                }
                .modifier(frameForCategories())
                
                
                NavigationLink(value: "Mood") {
                    Text("Mood")
                }
                .modifier(frameForCategories())
                
                NavigationLink("Search") {
                    Search(category: "")
                }
                .modifier(frameForCategories())
              
            }
            .navigationTitle("Traventure")
            .navigationDestination(for: String.self , destination: { value in
                //when the value equals a certain value than the view gets changed
                if value == "showCategories" {
                    Categories()
                        .navigationTitle("Choose a category")
                } else if value == "Mood" {
                    Mood()
                        .navigationTitle("Choose a Mood")
                } else {
                    //the value is taken from the catorization view where it gets changed
                    //and the same thing applys for mood
                    MapView(theme: value)
                }
            })
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background( LinearGradient(
                colors: [.yellow, .green, .yellow],
                startPoint: .top,
                endPoint: .bottom
            ))
            //this makes it span the entire screen
            .ignoresSafeArea()
            
        }
    }
}






//Arts and Culture: museum, musicVenue, theaterEducation: library, planetarium, school, universityEntertainment: movieTheater, nightlifeHealth & Safety: fireStation, hospital, pharmacyServices: laundry, postOfficeTransportation: airport, marina, publicTransportFood/Retail: foodMarket, gasStation, restaurant, store, wineryRecreation/Other: nationalPark, park, parking, restrooms, stadium, zoo

//museum, musicVenue, library, planetarium, school, movie theater, firstation, hospital, laundry, airport, marina, foodMarket, gasStation, erstaurant, store, national park, park, parking, restrooms, stadium, zoo
