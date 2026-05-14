//
//  Cagegories.swift
//  Internly-AMAC
//
//  Created by Alexander T. Manov on 5/12/26.
//

import SwiftUI

struct Categories: View{
    @State var path = NavigationPath()
    @State var selectedCategory: String = ""

    var body: some View{
            NavigationStack(path: $path){
                ScrollView {
                VStack{
                    Text("Arts and culture")
                    HStack{
                        Button {
                            selectedCategory = "Art Museum"
                            //go to map view with category museum
                            path.append("MapView")
                            print(selectedCategory)
                        } label: {
                            Text("Museum")
                        }
                        Button {
                            selectedCategory = "music"
                            //go to map view with category musicVenue
                            path.append("MapView")
                        } label: {
                            Text("Music")
                        }
                        Button {
                            selectedCategory = "movieTheater"
                            //go to map view with category musicVenue
                            path.append("MapView")
                        } label: {
                            Text("Movie Theater")
                            //the category above it is "universityEntertainment"
                        }
                    }
                    Text("TheaterEducation")
                    HStack{
                        Button {
                            selectedCategory = "library"
                            path.append("MapView")

                            //go to map view with category library
                        } label: {
                            Text("Library")
                        }
                        Button {
                            selectedCategory = "plenetarium"
                            path.append("MapView")

                            //go to map view with category planetarium
                        } label: {
                            Text("Planetarium")
                        }
                        Button {
                            selectedCategory = "school"
                            path.append("MapView")

                            //go to map view with category school
                        } label: {
                            Text("School")
                        }
                    }
                    Text("Safety")
                    HStack{
                        Button {
                            selectedCategory = "fireStation"
                            path.append("MapView")

                            //go to map view with category fireStation
                        } label: {
                            Text("FireStation")
                        }
                        Button {
                            selectedCategory = "hospital"
                            path.append("MapView")

                            //go to map view with category hospital
                        } label: {
                            Text("Hospital")
                        }
                    }
                    Text("Post Office Transportation")
                    HStack{
                        Button {
                            selectedCategory = "airport"
                            path.append("MapView")

                            //go to map view with category airport
                        } label: {
                            Text("Airport")
                        }
                        Button {
                            selectedCategory = "marina"
                            path.append("MapView")

                            //go to map view with category marina
                        } label: {
                            Text("Boat Docks")
                        }
                    }
                    Text("Food")
                    HStack{
                        Button {
                            selectedCategory = "foodMarket"
                            path.append("MapView")

                            //go to map view with category foodMarket
                        } label: {
                            Text("Food Markets")
                        }
                        Button {
                            selectedCategory = "restaurant"
                            path.append("MapView")

                            //go to map view with category restaurant
                        } label: {
                            Text("Restaurants")
                        }
                        Button {
                            selectedCategory = "store"
                            path.append("MapView")

                            //go to map view with category store
                        } label: {
                            Text("Stores")
                        }
                        Button {
                            selectedCategory = "gasStation"
                            path.append("MapView")

                            //go to map view with category gasStation
                        } label: {
                            Text("Gas Stations")
                        }
                    }
                    Text("Parks")
                    HStack{
                        Button {
                            selectedCategory = "nationalParks"
                            path.append("MapView")

                            //go to map view with category nationalParks
                        } label: {
                            Text("National Parks")
                        }
                        Button {
                            selectedCategory = "park"
                            path.append("MapView")

                            //go to map view with category park
                        } label: {
                            Text("Public Parks")
                        }
                        Button {
                            selectedCategory = "zoo"
                            path.append("MapView")

                            //go to map view with category zoo
                        } label: {
                            Text("Zoo")
                        }
                        Text("Other")
                        HStack{
                            Button {
                                selectedCategory = "stadium"
                                path.append("MapView")

                                //go to map view with category stadium
                            } label: {
                                Text("Stadiums")
                            }
                            Button {
                                selectedCategory = "parking"
                                path.append("MapView")

                                //go to map view with category parking
                            } label: {
                                Text("Parking")
                            }
                            Button {
                                selectedCategory = "restrooms"
                                path.append("MapView")

                                //go to map view with category restrooms
                            } label: {
                                Text("Restrooms")
                            }
                            
                        }
                    }
                }
            }.navigationDestination(for: String.self) { viewName in
                if viewName == "MapView" {
                    MapView(theme: selectedCategory)
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

