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
        Text("Hello, world!")
            .padding()
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
