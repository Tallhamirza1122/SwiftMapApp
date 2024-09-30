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
            updateMapRegion(for: mapLocation)
        }
        
    }
    
    @Published var mapRegion : MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
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

}
