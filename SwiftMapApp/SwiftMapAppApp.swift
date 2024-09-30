//
//  SwiftMapAppApp.swift
//  SwiftMapApp
//
//  Created by Tayyab  on 30/09/2024.
//

import SwiftUI

@main
struct SwiftMapAppApp: App {
    
    @StateObject private var LocationVM = LocationViewModel()

    
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(LocationVM)
        }
    }
}
