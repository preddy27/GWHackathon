
import SwiftUI
import MapKit

struct RestroomView: View {
    @State private var searchText = ""
    @State var coordinateRegion = MKCoordinateRegion(
      center: CLLocationCoordinate2D(latitude: 33.777, longitude: -84.396),
      span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.015))
    
    let tableView = UITableView()
    private var data = [
        Location(name: "West Village", latitude: 33.77963, longitude: -84.40357),
        Location(name: "Bobby Dodd Stadium", latitude: 33.7729, longitude: -84.39106),
        Location(name: "Howey", latitude: 33.77764, longitude: -84.39719),
        Location(name: "Klaus", latitude: 33.77719, longitude: -84.39475),
        Location(name: "CULC", latitude: 33.77511, longitude: -84.39519),
      ]
    
    var filtered: [String] = []
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                SearchBar(text: $searchText)
                    .position(x:200, y: 20)
                    .frame(width: 400, height: 50)
                Map(coordinateRegion: $coordinateRegion,
                    annotationItems: data) { place in
                  MapMarker(coordinate: place.coordinate, tint: .green)
                }.edgesIgnoringSafeArea(.all)
                    .position(x: 200, y:235)
                    .frame(width: 400, height: 500)
                if searchText.isEmpty {
                    List {
                        Text("West Village")
                        Text("Bobby Dodd Stadium")
                        Text("Howey")
                        Text("Klaus")
                        Text("CULC")
                    }
                    
                } else {
                    List(data.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })) { item in
                                        Text(item.name)
                                    }
                }
            }
        }
    }
}

struct RestroomView_Previews: PreviewProvider {
    static var previews: some View {
        RestroomView()
    }
}
