
import MapKit
import SwiftUI

struct ContentView: View {
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51, longitude: 10),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)))
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
        if viewModel.isUnlocked {
            MapReader { proxy in
                Map(initialPosition: startPosition) {
                    ForEach(viewModel.locations) { location in
                        Annotation(location.name, coordinate: location.coordinate) {
                            Image(systemName: "heart.circle")
                                .resizable()
                                .foregroundColor(.red)
                                .frame(width: 44, height: 44)
                                .background(.white)
                                .clipShape(.circle)
                                .onLongPressGesture {
                                    viewModel.selectedPlace = location
                                }
                        }
                    }
                }
                .mapStyle(viewModel.mapStyle ? .standard : .hybrid(elevation: .realistic))
                .onTapGesture { position in
                    if let coordinate = proxy.convert(position, from: .local) {
                        viewModel.addLocation(at: coordinate)
                    }
                }
                .sheet(item: $viewModel.selectedPlace) { place in
                    EditView(location: place) {
                        viewModel.update(location: $0)
                    }
                }
            }
            
            HStack {
                Spacer()
                
                Button{
                    viewModel.mapStyle = true
                } label: {
                    Image(systemName: "map")
                    Text("Standard")
                }
                .buttonStyle()
                
                Spacer()
                
                Button {
                    viewModel.mapStyle = false
                } label: {
                    Image(systemName: "map.fill")
                    Text("Hybrid")
                }
                .buttonStyle()
                
                Spacer()
            }
        } else {
            Button("Unlock Places", action: viewModel.authenticate)
                .buttonStyle()
                .alert(isPresented: $viewModel.isShowingAuthenticationAlert) {
                    Alert(
                        title: Text("Error!"),
                        message: Text("\(viewModel.authenticationAlertMessage)"),
                        dismissButton: .default(Text("Ok"))
                    )
                }
        }
    }
}

#Preview {
    ContentView()
}
