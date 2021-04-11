//
//  Location.swift
//
//

import Foundation
import MapKit

struct Location: Identifiable {
  var id = UUID()
  let name: String
  let latitude: Double
  let longitude: Double
  
  var coordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}
