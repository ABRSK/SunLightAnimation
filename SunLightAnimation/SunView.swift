//
//  SunView.swift
//  SunLightAnimation
//
//  Created by Андрей Барсук on 21.06.2022.
//

import SwiftUI

struct SunView: View {
    @Binding var sunIsUp: Bool
    private let size = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            OuterRaysView(sunIsUp: $sunIsUp)
                .frame(width: size, height: size)
                .scaleEffect(sunIsUp ? 1 : 0)
                .animation(
                    .easeInOut(duration: 0.5)
                    .delay(sunIsUp ? 2.5 : 0),
                    value: sunIsUp
                )
            InnerRaysView(sunIsUp: $sunIsUp, angle: -360)
                .frame(width: size / 3, height: size / 3)
                .scaleEffect(sunIsUp ? 1 : 0)
                .animation(
                    .easeInOut(duration: 0.25)
                    .delay(sunIsUp ? 2.25 : 0.5),
                    value: sunIsUp
                )
            InnerRaysView(sunIsUp: $sunIsUp, angle: 360)
                .frame(width: size / 3.4, height: size / 3.4)
                .scaleEffect(sunIsUp ? 1 : 0)
                .animation(
                    .easeInOut(duration: 0.25)
                    .delay(sunIsUp ? 2 : 0.75),
                    value: sunIsUp
                )
            ZStack {
                SunDiscView()
                    .frame(width: size / 3, height: size / 3)
                    .blur(radius: 35)
                SunDiscView()
                    .frame(width: size / 4, height: size / 4)
            }
            .offset(x: 0, y: sunIsUp ? 0 : UIScreen.main.bounds.height)
            .animation(
                .easeInOut(duration: 2)
                .delay(sunIsUp ? 0 : 1),
                value: sunIsUp
            )
        }
    }
}

struct SunView_Previews: PreviewProvider {
    static var previews: some View {
        SunView(sunIsUp: .constant(false))
    }
}
 
