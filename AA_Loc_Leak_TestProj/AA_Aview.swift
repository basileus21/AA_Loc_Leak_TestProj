//
//  AA_AView.swift
//  AA Loc Leak TestProject
//
//  Created by AxelMihal on 12/10/2024.
//  GitHub

import SwiftUI
import MapKit

struct AA_AView: View {
    @EnvironmentObject var locMgr: LocationsHandler

    @Binding var mapType: MapType

    @State var mapStyle: MapStyle = .standard

    var startLocation: Bool = false

    var body: some View {
        ZStack {
            showWorkingArea()
        }
        .onAppear() {
            if startLocation {
                locMgr.start()
            }
            setMapType()
        }
        .onDisappear() {
            locMgr.stopUpdates()
        }
    }
    
    func showWorkingArea() -> some View {
        switch mapType {
        case .standard:
            AnyView(AAMap(mapStyle: $mapStyle))
        case .imagery:
            AnyView(AAMap(mapStyle: $mapStyle))
        case .manual:
            AnyView(AAMap(mapStyle: $mapStyle))
        }
    }

    func setMapType() {
        switch mapType {
        case .standard, .manual:
            mapStyle = .standard
        case .imagery:
            mapStyle = .imagery
        }
    }
}

#Preview {
    AA_AView(mapType: .constant(.standard))
        .environmentObject(LocationsHandler.shared)
}
