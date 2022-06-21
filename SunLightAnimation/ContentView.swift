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
                startPoint: UnitPoint(x: 0.5, y: 0.25),
                endPoint: UnitPoint(x: 0.5, y: 1)
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
