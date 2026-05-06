import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    @State private var cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 42.0883603, longitude: -87.9806265),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )

    var body: some View {
        ZStack {
            Map(position: $cameraPosition)
                .ignoresSafeArea()

            Text("Internly")
                .font(.system(size: 50, weight: .semibold))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.white, .purple, .black],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)

        }
    }
}
//create it so from the adress we create the cordinates and then they get positioned on the map

