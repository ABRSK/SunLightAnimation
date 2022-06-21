//
//  SunDiscView.swift
//  SunLightAnimation
//
//  Created by Андрей Барсук on 21.06.2022.
//

import SwiftUI

struct SunDiscView: View {
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            let middle = size / 2
            
            Path { path in
                path.addArc(center: CGPoint(x: middle, y: middle), radius: middle, startAngle: .degrees(0), endAngle: .degrees(180), clockwise: true)
                path.addArc(center: CGPoint(x: middle, y: middle), radius: middle, startAngle: .degrees(180), endAngle: .degrees(0), clockwise: true)
            }
            .fill(
                RadialGradient(colors: [.orange, .yellow], center: UnitPoint(x: 0.5, y: 0.5), startRadius: 0, endRadius: size * 0.67)
            )
        }
    }
}

struct SunDiscView_Previews: PreviewProvider {
    static var previews: some View {
        SunDiscView()
            .frame(width: 200, height: 200)
    }
}
