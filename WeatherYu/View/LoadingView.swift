//
//  LoadingView.swift
//  WeatherYu
//
//  Created by YUNUS EMRE ÖZKAYA on 22.07.2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    LoadingView()
}
