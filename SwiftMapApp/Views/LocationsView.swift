//
//  LocationsView.swift
//  SwiftMapApp
//
//  Created by Tayyab  on 30/09/2024.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @StateObject private var locationVM = LocationViewModel()
    
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $locationVM.mapRegion)
                .ignoresSafeArea()
            
            VStack {
                header
                .padding()
                
                Spacer()
            }
        }
    }
}

// Preview
struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}

extension LocationsView {
    
    private var header : some View {
        VStack {
            Button {
                locationVM.toggleLocationlist()
            } label: {
                Text(locationVM.mapLocation.cityName + " " + locationVM.mapLocation.name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .frame(height:55)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment : .leading){
                        Image(systemName: "arrow.down")
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: locationVM.showLocationsList ? 180 : 0))
                    }
            }

            if locationVM.showLocationsList {
                LocationListView()
            }
        }
        .background(.thinMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.7), radius: 20, x: 10, y: 10)

    }
}
