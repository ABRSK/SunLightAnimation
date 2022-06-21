//
//  OuterRayView.swift
//  SunLightAnimation
//
//  Created by Андрей Барсук on 21.06.2022.
//

import SwiftUI

struct OuterRayView: View {
    @Binding var sunIsUp: Bool
    
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            let middle = size / 2
            let oneThird = size / 3
            let twoThirds = oneThird * 2
            let difference = oneThird * 0.18
            
            Path { path in
                path.move(to: CGPoint(x: oneThird - difference, y: middle))
                path.addLine(to: CGPoint(x: difference, y: middle))
                path.move(to: CGPoint(x: twoThirds + difference, y: middle))
                path.addLine(to: CGPoint(x: size - difference, y: middle))
                path.move(to: CGPoint(x: middle, y: oneThird - difference))
                path.addLine(to: CGPoint(x: middle, y: difference))
                path.move(to: CGPoint(x: middle, y: twoThirds + difference))
                path.addLine(to: CGPoint(x: middle, y: size - difference))
            }
            .stroke(.yellow, lineWidth: 3)
            .scaleEffect(sunIsUp ? 1 : 0.8)
            .animation(
                sunIsUp
                ? .easeInOut(duration: 1)
                .delay(Double.random(in: 0.1...0.25))
                .repeatForever(autoreverses: true)
                : .easeInOut(duration: 1),
                value: sunIsUp
            )
        }
    }
}

struct OuterRayView_Previews: PreviewProvider {
    static var previews: some View {
        OuterRayView(sunIsUp: .constant(true))
    }
}
