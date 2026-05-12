//
//  Cagegories.swift
//  Internly-AMAC
//
//  Created by Alexander T. Manov on 5/12/26.
//

import SwiftUI

struct Categories: View{
    var body: some View{
        @State var selectedCategory: String? = nil
        ScrollView {
            VStack{
                Text("Arts and culture")
                HStack{
                    Button {
                        selectedCategory = "museum"
                        //go to map view with category museum
                    } label: {
                        Text("Museum")
                    }
                    Button {
                        selectedCategory = "music"
                        //go to map view with category musicVenue
                    } label: {
                        Text("Music")
                    }
                    Button {
                        selectedCategory = "movieTheater"
                        //go to map view with category musicVenue
                    } label: {
                        Text("Movie Theater")
                        //the category above it is "universityEntertainment"
                    }
                }
                Text("TheaterEducation")
                HStack{
                    Button {
                        selectedCategory = "library"
                        //go to map view with category library
                    } label: {
                        Text("Library")
                    }
                    Button {
                        selectedCategory = "plenetarium"
                        //go to map view with category planetarium
                    } label: {
                        Text("Planetarium")
                    }
                    Button {
                        selectedCategory = "school"
                        //go to map view with category school
                    } label: {
                        Text("School")
                    }
                }
                Text("Safety")
                HStack{
                    Button {
                        selectedCategory = "fireStation"
                        //go to map view with category fireStation
                    } label: {
                        Text("FireStation")
                    }
                    Button {
                        selectedCategory = "hospital"
                        //go to map view with category hospital
                    } label: {
                        Text("Hospital")
                    }
                }
                Text("Post Office Transportation")
                HStack{
                    Button {
                        selectedCategory = "airport"
                        //go to map view with category airport
                    } label: {
                        Text("Airport")
                    }
                    Button {
                        selectedCategory = "marina"
                        //go to map view with category marina
                    } label: {
                        Text("Boat Docks")
                    }
                }
                Text("Food")
                HStack{
                    Button {
                        selectedCategory = "foodMarket"
                        //go to map view with category foodMarket
                    } label: {
                        Text("Food Markets")
                    }
                    Button {
                        selectedCategory = "restaurant"
                        //go to map view with category restaurant
                    } label: {
                        Text("Restaurants")
                    }
                    Button {
                        selectedCategory = "store"
                        //go to map view with category store
                    } label: {
                        Text("Stores")
                    }
                    Button {
                        selectedCategory = "gasStation"
                        //go to map view with category gasStation
                    } label: {
                        Text("Gas Stations")
                    }
                }
                Text("Parks")
                HStack{
                    Button {
                        selectedCategory = "nationalParks"
                        //go to map view with category nationalParks
                    } label: {
                        Text("National Parks")
                    }
                    Button {
                        selectedCategory = "park"
                        //go to map view with category park
                    } label: {
                        Text("Public Parks")
                    }
                    Button {
                        selectedCategory = "zoo"
                        //go to map view with category zoo
                    } label: {
                        Text("Zoo")
                    }
                    Text("Other")
                    HStack{
                        Button {
                            selectedCategory = "stadium"
                            //go to map view with category stadium
                        } label: {
                            Text("Stadiums")
                        }
                        Button {
                            selectedCategory = "parking"
                            //go to map view with category parking
                        } label: {
                            Text("Parking")
                        }
                        Button {
                            selectedCategory = "restrooms"
                            //go to map view with category restrooms
                        } label: {
                            Text("Restrooms")
                        }

                    }
                }
            }
        }
    }
}


//Arts and Culture: museum, musicVenue, ---
//theaterEducation: library, planetarium, school,---
//universityEntertainment: movieTheater,--
//nightlifeHealth & Safety: fireStation, hospital,--
//pharmacyServices: laundry,
//postOfficeTransportation: airport, marina,--
//publicTransportFood/Retail: foodMarket, gasStation, restaurant, store,--
//wineryRecreation/Other: nationalPark, park, parking, restrooms, stadium, zoo

