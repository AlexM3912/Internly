//
//  PlaceMark.swift
//  Internly-AMAC
//
//  Created by Alexander T. Manov on 5/8/26.
//

import SwiftUI
import MapKit

struct PlaceInfoBox: View {
    //gets the item from the map and then custumizes the annotation to show certain vlaues
    let item: MKMapItem
    @State var description = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            //shoes the name of the place and if there is none then it sets the name to unknown name
            Text(item.name ?? "Unknown Place")
                .font(.headline)
                .foregroundColor(.primary)
            
            //sets the address, the if let is basically saying that only do this if the parameter in this case address exists
            if let address = item.address {
                //the ! unwrappes the address since its of type optional
                Text(address.shortAddress!)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            // here it does the same thing but with the phoneNumber
            if let phoneNumber = item.phoneNumber{
                Text(phoneNumber.count == 0 ? "No Phone Number" : phoneNumber)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            //same this with the website, it sets the variable website to the pulled items url and then shows it
            if let website = item.url{
                VStack {
                    Link("Go To Website", destination: website)
                        .font(.caption)
                        .foregroundColor(.blue)
                    Text(description)
                        .font(.caption)
                    //these two lines make it so the text shows the description with unlimited space going vertical
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)

                }
            }
            
        }
        .padding(10)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
        //makes a task that runs in the background
        .task(id: item) {
            //sets the website
            if let website = item.url{
                //gaurd let is like if let but with it you have to have add a second part that tells what do if there is no value
                //the try? makes it so the app dosent crash
                //the await makes it so it dosent freeze the entire app as it says "this can take a while run it in the background"
                //the procces is making a URL session where it downloads the data of the website
                guard let(data, _) = try? await URLSession.shared.data(from: website) else { return }
                //sets the htmlfile that was pulled from above and then in encodes it since it get pulled as bytes and then we set that data to the data parameter and encodes it in utf8 that most websites use, from here we have the code of the html file downloaded by the app
                guard let htmlFile = String(data: data, encoding: .utf8) else { return }
                
                //this is creating a string which later we will use it to search
                let searchString = "<meta name=\"description\" content=\""
                //this next part is searching the file for the search string from above
                guard let range = htmlFile.range(of: searchString) else { return }
                //the start is saying when to start returning the string, upperBound is saying return the things after the last charecter from the range variable
                let start  = range.upperBound
                //the end index is saying at what part to end it, it searches from the quotation marks and then i'll return the string untill that point
                guard let end = htmlFile[start...].firstIndex(of: "\"") else { return }
                //final part, sets the string from the description in the html and it returns the string between the start variable and the end variable, where it starts after the character after the search sting and ends when it finds quotation marks
                        let description = String(htmlFile[start..<end])
                
                //switches from the backend thread to the main thread, which then is sets the dscription variable to the @State description variable
                        await MainActor.run {
                            self.description = description
                        }
            }
        }
    }
}
