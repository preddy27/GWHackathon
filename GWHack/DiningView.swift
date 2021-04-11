
import SwiftUI
import MapKit

struct DiningView: View {
    @State private var searchText = ""
    @State var coordinateRegion = MKCoordinateRegion(
      center: CLLocationCoordinate2D(latitude: 33.777, longitude: -84.397),
      span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.015))
    
    let tableView = UITableView()
    private var data = [
        Location(name: "North Avenue Dining", latitude: 33.77119, longitude: -84.39049),
        Location(name: "West Village", latitude: 33.77963, longitude: -84.40357),
        Location(name: "Exhibition Hall", latitude: 33.77498, longitude: -84.40084),
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
                  MapMarker(coordinate: place.coordinate, tint: .black)
                }.edgesIgnoringSafeArea(.all)
                    .position(x: 200, y:235)
                    .frame(width: 400, height: 500)
                if searchText.isEmpty {
                    List {
                        Text("North Avenue Dining")
                        Text("West Village")
                        Text("Exhibition Hall")
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

struct DiningView_Previews: PreviewProvider {
    static var previews: some View {
        DiningView()
    }
}
