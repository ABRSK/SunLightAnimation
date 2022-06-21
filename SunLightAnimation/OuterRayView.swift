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
            
            Path { path in
                path.move(to: CGPoint(x: oneThird, y: middle))
                path.addLine(to: CGPoint(x: 0, y: middle))
                path.move(to: CGPoint(x: twoThirds, y: middle))
                path.addLine(to: CGPoint(x: size, y: middle))
                path.move(to: CGPoint(x: middle, y: oneThird))
                path.addLine(to: CGPoint(x: middle, y: 0))
                path.move(to: CGPoint(x: middle, y: twoThirds))
                path.addLine(to: CGPoint(x: middle, y: size))
            }
            .stroke(.yellow, lineWidth: 3)
            .scaleEffect(sunIsUp ? 1 : 0.75)
            .animation(
                .easeInOut(duration: 1)
                .delay(Double.random(in: 0.1...0.25))
                .repeatForever(autoreverses: true),
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
