//
//  ContentView.swift
//  WeatherYu
//
//  Created by YUNUS EMRE ÖZKAYA on 22.07.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                }else { LoadingView()
                        .task{
                            do { weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                
                            }
                            catch {
                                print("Eror getting weather: \(error)")
                            }
                        }
                }
            }else {
                if locationManager.isLoading{
                     LoadingView()
                }
                else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.659, saturation: 0.937, brightness: 0.111))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
