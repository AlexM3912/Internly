//
//  Internships.swift
//  Internly-AMAC
//
//  Created by Alexander T. Manov on 5/4/26.
//

import Foundation
internal import Combine

struct Internship: Identifiable {
    let id = UUID()
    let title: String
    let ageRange: String
    let company: String
    let location: String
    let category: String
}

class DataManeger: ObservableObject {
    @Published var internships: [Internship] = [
        Internship(title: "Car Repair", ageRange: "Age 16-18", company: "Andy's Auto Cars", location: "101 E Rand Rd, Mt Prospect, IL 60056", category: "Cars"),
        Internship(title: "Cooking Chef", ageRange: "Age 17-18", company: "Tylers Cooking Shop", location: "208 S Arlington Heights Rd, Arlington Heights, IL 60005", category: "Food"),
        Internship(title: "Base programmer", ageRange: "Age 18", company: "Ari's Computer Shop", location: "1800 Central Rd, Mt Prospect, IL 60056", category: "Software")
    ]
    
}
