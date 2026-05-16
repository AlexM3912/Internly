//
//  PlaceMark.swift
//  Internly-AMAC
//
//  Created by Alexander T. Manov on 5/8/26.
//

import SwiftUI
import MapKit

struct PlaceInfoBox: View {
    let item: MKMapItem

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(item.name ?? "Unknown Place")
                .font(.headline)
                .foregroundColor(.primary)
            
            if let address = item.address {
                Text(address.shortAddress!)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            if let phoneNumber = item.phoneNumber{
                Text(phoneNumber.count == 0 ? "No Phone Number" : phoneNumber)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            if let website = item.url{
                Link("Go To Website", destination: website)
                .font(.caption)
                .foregroundColor(.blue)
            }
            
        }
        .padding(10)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}
