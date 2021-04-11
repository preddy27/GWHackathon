
import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            RestroomView()
                .tabItem {
                    Label("Restrooms", systemImage: "hand.wave")
                }
            ParkingView()
                .tabItem {
                    Label("Parking", systemImage: "car")
                }
            DiningView()
                .tabItem {
                    Label("Dining", systemImage: "manatsign.circle")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
