import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    
    // location manager makes it possible to view the devices location and take the data from it
    //the map items make it possible to extract the data from after the search
    //camera position sets the frame of the camera
    @StateObject private var locationManager = LocationManager()
    @State private var mapItems: [MKMapItem] = []
    @State private var selectedItem: MKMapItem?
    @State private var cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 42.0883603, longitude: -87.9806265),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )
    
    //this is the magic as it takes this value from the other navigation links that serve as buttons
    let theme: String
    
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                //uses the variable from above to set the locaiton of the map
                Map(position: $cameraPosition) {
                    //this displays the blue dot to signal the location
                    UserAnnotation()
                    
                    ForEach(mapItems, id: \.self) { item in
                        //makes a annotation which is  a placemark but it contains info about each place.
                        Annotation(item.name ?? "Place", coordinate: item.location.coordinate){
                            VStack(spacing: 0) {
                                if selectedItem == item {
                                    //this controls what info shows by giving the item to the view that then manipualtes where it then goes to display
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
                    
                    //this here make the map from the default region to the users location
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
                //make real time location changing and makes it so the app asks you for your location
                locationManager.requestPermission()
                locationManager.startUpdating()
            }
            
            Button {
                guard let location = locationManager.location else { return }
        //searches smaller region when the button is clicked
                let region = MKCoordinateRegion(
                    center: location.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
                )
                
                cameraPosition = .region(region)
                performSearch(for: theme, in: region)
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
    
    //this is the funciton that allows you too search for your location and searhes that area for the items as you ask make a search request
    //the first parameter is setting what category you want and the second one tells what region to search
    func performSearch(for category: String, in region: MKCoordinateRegion) {
    //makes a request to apples searvers to search an area
        let request = MKLocalSearch.Request()
    //tells what to search for, the naturalLaunguge query is just saying what exactly do you want to search for
        request.naturalLanguageQuery = category
    //search this region
        request.region = region
    //it creates an actual search with the request presented before where its gonna search the category
        let search = MKLocalSearch(request: request)
    //makes a task since getting the data takes time, it switches to the background thread
        Task {
            do {
        //starts the search by the .start, the await achknowliges that this will take a while, so its saying, i'll wait here, do other parts and wake me up when we get a response. The try acknolage that it can have multiple errors and so if there is an error it will go to the catch block
                let response = try await search.start()
        //switches back to the main thread and runs the code beneath it, in this case it sets the map items to the respose that we got from the apple searvers
                await MainActor.run {
                    self.mapItems = response.mapItems
                }
                //if the fails go to the catch
            } catch {
                //returns a clear description of the error
                print("Search failed: \(error.localizedDescription)")
            }
        }
    }
}

