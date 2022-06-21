//
//  InnerRaysView.swift
//  SunLightAnimation
//
//  Created by Андрей Барсук on 21.06.2022.
//

import SwiftUI

struct InnerRaysView: View {
    @Binding var sunIsUp: Bool
    let angle: Double
    
    var body: some View {
        ZStack {
            ForEach(0..<9) { iteration in
                InnerRayView()
                    .rotationEffect(.degrees(Double(10 * iteration)))
            }
        }
        .rotationEffect(.degrees(sunIsUp ? angle : 0))
        .animation(
            sunIsUp
            ? .linear(duration: 10).repeatForever(autoreverses: false)
            : .linear(duration: 10),
            value: sunIsUp
        )
    }
}

struct InnerRaysView_Previews: PreviewProvider {
    static var previews: some View {
        InnerRaysView(sunIsUp: .constant(true), angle: 360)
            .frame(width: 200, height: 200)
    }
}
