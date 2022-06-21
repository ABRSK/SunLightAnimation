//
//  OuterRaysView.swift
//  SunLightAnimation
//
//  Created by Андрей Барсук on 21.06.2022.
//

import SwiftUI

struct OuterRaysView: View {
    @Binding var sunIsUp: Bool
    
    var body: some View {
        ZStack {
            ForEach(0..<18) { iteration in
                OuterRayView(sunIsUp: $sunIsUp)
                    .rotationEffect(.degrees(Double(5 * iteration)))
            }
        }
        .rotationEffect(.degrees(sunIsUp ? 360 : 0))
        .animation(
            sunIsUp
            ? .linear(duration: 60).repeatForever(autoreverses: false)
            : .linear(duration: 2),
            value: sunIsUp
        )
    }
}

struct OuterRaysView_Previews: PreviewProvider {
    static var previews: some View {
        OuterRaysView(sunIsUp: .constant(true))
            .frame(width: 200, height: 200)
    }
}
