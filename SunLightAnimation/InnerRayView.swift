//
//  InnerRayView.swift
//  SunLightAnimation
//
//  Created by Андрей Барсук on 21.06.2022.
//

import SwiftUI

struct InnerRayView: View {
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            let middle = size / 2
            
            Path { path in
                path.addArc(
                    center: CGPoint(x: middle, y: middle),
                    radius: middle,
                    startAngle: .degrees(0),
                    endAngle: .degrees(180),
                    clockwise: true
                )
                path.addArc(
                    center: CGPoint(x: middle, y: middle),
                    radius: middle,
                    startAngle: .degrees(180),
                    endAngle: .degrees(0),
                    clockwise: true
                )
            }
            .stroke(.yellow)
            
            Path { path in
                path.move(to: CGPoint(x: middle, y: 0))
                path.addLine(to: CGPoint(x: middle, y: size))
                path.move(to: CGPoint(x: 0, y: middle))
                path.addLine(to: CGPoint(x: size, y: middle))
            }
            .stroke(.orange)
        }
    }
}

struct InnerRayView_Previews: PreviewProvider {
    static var previews: some View {
        InnerRayView()
            .frame(width: 200, height: 200)
    }
}
