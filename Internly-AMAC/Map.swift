import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    @StateObject private var locationManager = LocationManager()

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
                .onReceive(locationManager.$location) { location in
                    guard let location = location else { return }

                    cameraPosition = .region(
                        MKCoordinateRegion(
                            center: location.coordinate,
                            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                        )
                    )
                }

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
        .onAppear {
            locationManager.requestPermission()
            locationManager.startUpdating()
        }
    }
}

