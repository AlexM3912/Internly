import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var mapItems: [MKMapItem] = []
    @State private var selectedItem: MKMapItem?
    @State private var cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 42.0883603, longitude: -87.9806265),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )
    
    let theme: String
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Map(position: $cameraPosition) {
                    UserAnnotation()
                    
                    ForEach(mapItems, id: \.self) { item in
                        Annotation(item.name ?? "Place", coordinate: item.location.coordinate){
                            VStack(spacing: 0) {
                                if selectedItem == item {
                                    PlaceInfoBox(item: item)
                                        .offset(y: -5)
                                        .transition(.scale.combined(with: .opacity))
                                }
                                
                                Image(systemName: "mappin.circle.fill")
                                    .font(.title)
                                    .foregroundStyle(.red)
                                    .background(Circle().fill(.white))
                                    .onTapGesture {
                                        withAnimation(.spring()) {
                                            selectedItem = (selectedItem == item) ? nil : item
                                        }
                                    }
                            }
                        }
                    }
                }
                .ignoresSafeArea(edges: .top)
                .onReceive(locationManager.$location) { location in
                    guard let location = location else { return }
                    
                    let region = MKCoordinateRegion(
                        center: location.coordinate,
                        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                    )
                    
                    cameraPosition = .region(region)
                    
                    performSearch(for: theme, in: region)
                }
                .mapControls {
                    MapUserLocationButton()
                    MapCompass()
                }
                
                Text("Traventure")
                    .font(.system(size: 50, weight: .semibold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.white, .green, .yellow],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding()
            }
            .onAppear{
                locationManager.requestPermission()
                locationManager.startUpdating()
            }
            
            Button {
                guard let location = locationManager.location else { return }
                
                let region = MKCoordinateRegion(
                    center: location.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
                )
                
                cameraPosition = .region(region)
                performSearch(for: theme, in: region)
                print(theme)
            } label: {
                Text("Perform Search")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
            }
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


//Arts and Culture: museum, musicVenue, theaterEducation: library, planetarium, school, universityEntertainment: movieTheater, nightlifeHealth & Safety: fireStation, hospital, pharmacyServices: laundry, postOfficeTransportation: airport, marina, publicTransportFood/Retail: foodMarket, gasStation, restaurant, store, wineryRecreation/Other: nationalPark, park, parking, restrooms, stadium, zoo

//museum, musicVenue, library, planetarium, school, movie theater, firstation, hospital, laundry, airport, marina, foodMarket, gasStation, erstaurant, store, national park, park, parking, restrooms, stadium, zoo
