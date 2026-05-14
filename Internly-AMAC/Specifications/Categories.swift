//
//  Cagegories.swift
//  Internly-AMAC
//
//  Created by Alexander T. Manov on 5/12/26.
//

import SwiftUI

struct Categories: View{
    //    @State var path = NavigationPath()
    //    @Binding var selectedCategory: String
    
    var body: some View{
        ScrollView {
            VStack{
                Text("Arts and culture")
                HStack{
                    NavigationLink(value: "Art Museum") {
                        Text("Museum")
                    }
                    .modifier(frameForTopics())
                    NavigationLink(value: "Music") {
                        Text("Music")
                    }
                    NavigationLink(value: "Movie Theater") {
                        Text("Movie Theater")
                    }
                }
                Text("TheaterEducation")
                HStack{
                    NavigationLink(value: "Library") {
                        Text("Library")
                    }
                    NavigationLink(value: "Planetarium") {
                        Text("Planetarium")
                    }
                    NavigationLink(value: "School") {
                        Text("Schools")
                    }
                }
                Text("Safety")
                HStack{
                    NavigationLink(value: "Fire Station") {
                                        Text("Fire Station")
                                    }
                    NavigationLink(value: "Hospital") {
                                        Text("Hospital")
                                    }
                }
                Text("Post Office Transportation")
                HStack{
                    NavigationLink(value: "Airport") {
                                        Text("Airport")
                                    }
                    NavigationLink(value: "Marina") {
                                        Text("Boat dock")
                                    }
                }
                Text("Food")
                HStack{
                    NavigationLink(value: "Food Market") {
                                        Text("Food Market")
                                    }
                    NavigationLink(value: "Resteraunt") {
                                        Text("Resteraunt")
                                    }
                    NavigationLink(value: "Store") {
                                        Text("Store")
                                    }
                    NavigationLink(value: "Gas Station") {
                                        Text("Gas Station")
                                    }
                }
                Text("Parks")
                HStack{
                    NavigationLink(value: "National Park") {
                                        Text("National Parks")
                                    }
                    NavigationLink(value: "Park") {
                                        Text("Park")
                                    }
                    NavigationLink(value: "Zoo") {
                                        Text("Zoo")
                                    }
                    Text("Other")
                    HStack{
                        NavigationLink(value: "Stadium") {
                                            Text("Stadium")
                                        }
                        NavigationLink(value: "Parking") {
                                            Text("Parking")
                                        }
                        NavigationLink(value: "Restrooms") {
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

