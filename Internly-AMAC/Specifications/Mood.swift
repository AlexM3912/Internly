//
//  Mood.swift
//  Internly-AMAC
//
//  Created by Alexander T. Manov on 5/12/26.
//

import SwiftUI

struct Mood: View{
    var body: some View{
        VStack{
            HStack{
                NavigationLink(value: "Park") {
                    Text("Serene")
                }
                .modifier(frameForTopics())
                NavigationLink(value: "Nightlife Spot") {
                    Text("Energetic")
                }
                .modifier(frameForTopics())

                NavigationLink(value: "Train Station") {
                    Text("Gloomy")
                }
                .modifier(frameForTopics())

            }
            HStack{
                NavigationLink(value: "FIne Dining Restaurant") {
                    Text("Romantic")
                }
                .modifier(frameForTopics())

                NavigationLink(value: "Cafe") {
                    Text("Anxious")
                }
                .modifier(frameForTopics())

                NavigationLink(value: "Diner") {
                    Text("Nostalgic")
                }
                .modifier(frameForTopics())

            }
            HStack{
                NavigationLink(value: "Museum") {
                                    Text("Inspired")
                                }
                .modifier(frameForTopics())

                NavigationLink(value: "Beach") {
                                    Text("Lonely")
                                }
                .modifier(frameForTopics())
                
                NavigationLink(value: "Amusement Park") {
                                    Text("Joyful")
                                }
                .modifier(frameForTopics())

            }
            HStack{
                NavigationLink(value: "Library") {
                                    Text("Focused")
                                }
                .modifier(frameForTopics())

                NavigationLink(value: "Shopping District") {
                                    Text("Chaotic")
                                }
                .modifier(frameForTopics())
                NavigationLink(value: "Hopeful") {
                                    Text("Scenic Lookout")
                                }
                .modifier(frameForTopics())

            }
            HStack{
                NavigationLink(value: "Coffee Shop") {
                                    Text("Comforted")
                                }
                .modifier(frameForTopics())

                NavigationLink(value: "Gas Station") {
                                    Text("Restless")
                                }
                .modifier(frameForTopics())

                NavigationLink(value: "Business Center") {
                                    Text("Empowered")
                                }
                .modifier(frameForTopics())


            }
            HStack{
                NavigationLink(value: "Arcade") {
                                    Text("Plauful")
                                }
                .modifier(frameForTopics())

                NavigationLink(value: "Garden") {
                                    Text("Reflective")
                                }
                .modifier(frameForTopics())

                NavigationLink(value: "Market") {
                                    Text("Stressed")
                                }
                .modifier(frameForTopics())
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
