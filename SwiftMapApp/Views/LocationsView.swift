//
//  LocationsView.swift
//  SwiftMapApp
//
//  Created by Tayyab  on 30/09/2024.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @StateObject private var LocationVM = LocationViewModel()
    
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $LocationVM.mapRegion)
        }
    }
}

// Preview
struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}
