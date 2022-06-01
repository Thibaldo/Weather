//
//  GradientBackground.swift
//  Weather
//
//  Created by Pro on 26/05/2022.
//

import SwiftUI

struct AnimatedGradientBackground: View {
    @State private var animateGradient = false
    
    var body: some View {
        RadialGradient(colors: [Color("gradientTop"), Color("gradientBottom")], center: animateGradient ? .topLeading : .bottomLeading, startRadius: animateGradient ? 600 : 200, endRadius: animateGradient ? 50 : 100)
            .onAppear {
                withAnimation(.linear(duration: 8.0).repeatForever(autoreverses: true)) {
                    animateGradient.toggle()
                }
            }
            .ignoresSafeArea()
            .blur(radius: 100)
    }
}

struct AnimatedGradientBackground_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedGradientBackground()
    }
}
