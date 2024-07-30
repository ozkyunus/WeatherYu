//
//  WelcomeView.swift
//  WeatherYu
//
//  Created by YUNUS EMRE ÖZKAYA on 22.07.2024.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationmanager: LocationManager
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Welcome to the WeatherYu")
                    .bold().font(.title)
                Text("Please share your current location to get the weather in your area")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationmanager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
