//
//  Personalization.swift
//  Internly-AMAC
//
//  Created by Alexander T. Manov on 5/12/26.
//

import SwiftUI

struct Personalization: View{
    var body: some View{
        VStack{
            
            //recomneded place
//            Button {
//                //GoTo specific categories
//            } label: {
//                Text("CATEGORIES")
//            }
            NavigationStack{
                NavigationLink("Categories") {
                    Categories()
                }
                .navigationTitle("Main menu")
                .frame(width: 200, height: 100, alignment: .center)
                .foregroundStyle(.blue)
                .border(Color.teal, width: 2)
            }
            Button {
                //GoTo mood prefrences
            } label: {
                Text("Mood")
            }
            Button {
                //GoTo random page
            } label: {
                Text("Suprise Me")
            }
            Button {
                //GoTo random page
            } label: {
                Text("Searh")
            }


        }
    }
}






//Arts and Culture: museum, musicVenue, theaterEducation: library, planetarium, school, universityEntertainment: movieTheater, nightlifeHealth & Safety: fireStation, hospital, pharmacyServices: laundry, postOfficeTransportation: airport, marina, publicTransportFood/Retail: foodMarket, gasStation, restaurant, store, wineryRecreation/Other: nationalPark, park, parking, restrooms, stadium, zoo

//museum, musicVenue, library, planetarium, school, movie theater, firstation, hospital, laundry, airport, marina, foodMarket, gasStation, erstaurant, store, national park, park, parking, restrooms, stadium, zoo
