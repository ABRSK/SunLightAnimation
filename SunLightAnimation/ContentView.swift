//
//  ContentView.swift
//  SunLightAnimation
//
//  Created by Андрей Барсук on 21.06.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var sunIsUp = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.indigo, .blue],
                startPoint: UnitPoint(x: 0.5, y: sunIsUp ? 0.25 : 0.9999),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
            .animation(
                .easeInOut(duration: 2)
                .delay(sunIsUp ? 0 : 0.5),
                value: sunIsUp
            )
            .ignoresSafeArea()
            VStack {
                SunView(sunIsUp: $sunIsUp)
                Spacer()
                Button(action: toggleAnimation) {
                    Text(sunIsUp ? "Set The Sun" : "Rise The Sun")
                        .foregroundColor(.white)
                }
                .padding()
                .background(sunIsUp ? .indigo : .orange)
                .cornerRadius(20)
            }
        }
    }
    
    private func toggleAnimation() {
        withAnimation {
            sunIsUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
