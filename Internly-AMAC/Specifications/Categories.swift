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
        //creates navigation links with variables to each type of place, with the modifer we created beforee
        //this all is in the navigationStack from the personalization view, as having multiple freaks out the app and makes thing lag and not work, it takes the value and gives it to personalization
                Text("Arts and culture")
                HStack{
                    NavigationLink(value: "Art Museum") {
                        Text("Museum")
                    }
                    .modifier(frameForTopics())
                    NavigationLink(value: "Music") {
                        Text("Music")
                    }
                    .modifier(frameForTopics())

                    NavigationLink(value: "Movie Theater") {
                        Text("Movie Theater")
                    }
                    .modifier(frameForTopics())

                }
                Text("TheaterEducation")
                HStack{
                    NavigationLink(value: "Library") {
                        Text("Library")
                    }
                    .modifier(frameForTopics())

                    NavigationLink(value: "Planetarium") {
                        Text("Planetarium")
                    }
                    .modifier(frameForTopics())

                    NavigationLink(value: "School") {
                        Text("Schools")
                    }
                    .modifier(frameForTopics())

                }
                Text("Safety")
                HStack{
                    NavigationLink(value: "Fire Station") {
                                        Text("Fire Station")
                                    }
                    .modifier(frameForTopics())

                    NavigationLink(value: "Hospital") {
                                        Text("Hospital")
                                    }
                    .modifier(frameForTopics())

                }
                Text("Post Office Transportation")
                HStack{
                    NavigationLink(value: "Airport") {
                                        Text("Airport")
                                    }
                    .modifier(frameForTopics())

                    NavigationLink(value: "Marina") {
                                        Text("Boat dock")
                                    }
                    .modifier(frameForTopics())

                }
                Text("Food")
                HStack{
                    NavigationLink(value: "Food Market") {
                                        Text("Food Market")
                                    }
                    .modifier(frameForTopics())

                    NavigationLink(value: "Resteraunt") {
                                        Text("Resteraunt")
                                    }
                    .modifier(frameForTopics())

                    NavigationLink(value: "Store") {
                                        Text("Store")
                                    }
                    .modifier(frameForTopics())

                    NavigationLink(value: "Gas Station") {
                                        Text("Gas Station")
                                    }
                    .modifier(frameForTopics())

                }
                Text("Parks")
                HStack{
                    NavigationLink(value: "National Park") {
                                        Text("National Parks")
                                    }
                    .modifier(frameForTopics())

                    NavigationLink(value: "Park") {
                                        Text("Park")
                                    }
                    .modifier(frameForTopics())

                    NavigationLink(value: "Zoo") {
                                        Text("Zoo") 
                                    }
                    .modifier(frameForTopics())

                    Text("Other")
                    HStack{
                        NavigationLink(value: "Stadium") {
                                            Text("Stadium")
                                        }
                        .modifier(frameForTopics())

                        NavigationLink(value: "Parking") {
                                            Text("Parking")
                                        }
                        .modifier(frameForTopics())

                        NavigationLink(value: "Restrooms") {
                                            Text("Restrooms")
                                        }
                        .modifier(frameForTopics())

                                                
                    }
                }
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



//Arts and Culture: museum, musicVenue, ---
//theaterEducation: library, planetarium, school,---
//universityEntertainment: movieTheater,--
//nightlifeHealth & Safety: fireStation, hospital,--
//pharmacyServices: laundry,
//postOfficeTransportation: airport, marina,--
//publicTransportFood/Retail: foodMarket, gasStation, restaurant, store,--
//wineryRecreation/Other: nationalPark, park, parking, restrooms, stadium, zoo

