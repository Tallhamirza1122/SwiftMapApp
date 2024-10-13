//
//  LocationViewModel.swift
//  SwiftMapApp
//
//  Created by Tayyab  on 30/09/2024.
//

import Foundation
import MapKit
import SwiftUI

class LocationViewModel : ObservableObject {
    
    // All loaded Locations
    @Published var locations : [Location]
    
    // Current Location on Map
    @Published var mapLocation : Location
    {
        didSet {
            print("Updated mapLocation to: \(mapLocation.name)")
            updateMapRegion(for: mapLocation)
        }
    }
    
    // Current Region only
    @Published var mapRegion : MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // Showing List of locations
    @Published  var showLocationsList : Bool = false
    
    init()
    {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(for: locations.first!)
    }
    
    private func updateMapRegion(for location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
        }
    }
    
     func toggleLocationlist() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func nextLocationList(location : Location){
        print("Selected location: \(location.name)")
            mapLocation = location
            showLocationsList = false
    }

}
