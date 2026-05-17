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
    @State var description = ""
    
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
                VStack {
                    Link("Go To Website", destination: website)
                        .font(.caption)
                        .foregroundColor(.blue)
                    Text(description)
                        .font(.caption)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)

                }
            }
            
        }
        .padding(10)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
        .task(id: item) {
            if let website = item.url{
                guard let(data, _) = try? await URLSession.shared.data(from: website) else { return }
                guard let htmlFile = String(data: data, encoding: .utf8) else { return }
                
                let searchString = "<meta name=\"description\" content=\""
                guard let range = htmlFile.range(of: searchString) else { return }
                let start  = range.upperBound
                guard let end = htmlFile[start...].firstIndex(of: "\"") else { return }
                        let description = String(htmlFile[start..<end])
                        await MainActor.run {
                            self.description = description
                        }
            }
        }
    }
}
