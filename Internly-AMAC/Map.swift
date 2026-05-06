import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var mapItems: [MKMapItem] = []
    @State private var cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 42.0883603, longitude: -87.9806265),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )

    var body: some View {
        ZStack {
            Map(position: $cameraPosition) {
                ForEach(mapItems, id: \.self) { item in
                    Marker(item.name ?? "Place", coordinate: item.placemark.coordinate)
                }
            }
                .ignoresSafeArea()
                .onReceive(locationManager.$location) { location in
                    guard let location = location else { return }

                    let region = MKCoordinateRegion(
                            center: location.coordinate,
                            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                        )

                    cameraPosition = .region(region)

                    performSearch(for: "Food", in: region)
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
    func performSearch(for category: String, in region: MKCoordinateRegion) {
            let request = MKLocalSearch.Request()
            request.naturalLanguageQuery = category
            request.region = region
            
            let search = MKLocalSearch(request: request)
            
            Task {
                do {
                    let response = try await search.start()
                    
                    await MainActor.run {
                        self.mapItems = response.mapItems
                    }
                } catch {
                    print("Search failed: \(error.localizedDescription)")
                }
            }
        }
    }



