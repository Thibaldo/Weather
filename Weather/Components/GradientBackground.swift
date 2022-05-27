//
//  GradientBackground.swift
//  Weather
//
//  Created by Pro on 26/05/2022.
//

import SwiftUI

struct GradientBackground: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color("gradientTop"), Color("gradientBottom")]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }
}

struct GradientBackground_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackground()
    }
}
