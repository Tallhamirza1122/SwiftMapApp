//
//  LocationListView.swift
//  SwiftMapApp
//
//  Created by Talha's Macbook on 06/10/2024.
//

import SwiftUI

struct LocationListView: View {
    
    @EnvironmentObject private var VM : LocationViewModel
    
    var body: some View {
        List {
            ForEach (VM.locations) { location in
                Button {
            VM.nextLocationList(location: location)
                } label:
                {
            ListRowView(location: location)
                 }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
            .environmentObject(LocationViewModel())
    }
}

extension LocationListView {
    
    
    private func ListRowView(location : Location) -> some View {
        HStack
        {
            if let image = location.imageNames.first {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .cornerRadius(10)
            }
            VStack (alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth : .infinity, alignment: .leading)
            
        }
    }
    
    
}
